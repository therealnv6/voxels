#include "imgui.h"
#include "movement.hpp"
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <buffer.hpp>
#include <camera.hpp>
#include <framework.hpp>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <optional>
#include <spdlog/common.h>
#include <voxel/svo.hpp>
#define GLM_ENABLE_EXPERIMENTAL
#include <entity.hpp>
#include <glm/gtx/string_cast.hpp>
#include <imgui.h>
#include <info.hpp>
#include <render.hpp>
#include <shader.hpp>
#include <spdlog/spdlog.h>
#include <ui.hpp>
#include <voxel/grid.hpp>
#include <voxel/ray.hpp>
#include <voxel/tracing.hpp>
#include <window.hpp>

constexpr int CHUNK_WIDTH = 16;
constexpr int CHUNK_HEIGHT = 16;
constexpr int CHUNK_DEPTH = 16;

struct listener {
	void tick_svo(const frame::tick_event &event)
	{
		static int draw_turn = 0;

		auto registry = event.registry;
		auto framework = event.data;

		auto &camera = registry->ctx().get<gfx::camera>();

		auto &shader = registry->ctx().get<shader::shader>();
		auto &svo = registry->ctx().get<svo::svo>();

		gfx::clear(gfx::clear_buffer::Color | gfx::clear_buffer::Depth);

		shader.bind();

		svo::voxel_set voxels;

		voxels.reserve(80 * 80);

		{
			glm::vec3 player_position = camera.get_position();
			ray::raycast cast(player_position, camera.get_direction());

			cast.set_origin(player_position);

			const int min_yaw = -45, max_yaw = 45, min_pitch = -45, max_pitch = 45;
			const int near_yaw_step = 1, far_yaw_step = 5;
			const int near_pitch_step = 1, far_pitch_step = 5;

			for (int yaw = min_yaw; yaw <= max_yaw; yaw += near_yaw_step)
			{
				float horizontalAngle = glm::radians(static_cast<float>(yaw));

				for (int pitch = min_pitch; pitch <= max_pitch; pitch += near_pitch_step)
				{
					float verticalAngle = glm::radians(static_cast<float>(pitch));

					cast.set_direction(glm::rotate(
						glm::rotate(camera.get_direction(), verticalAngle, glm::vec3(1.0f, 0.0f, 0.0f)), horizontalAngle, glm::vec3(0.0f, 1.0f, 0.0f)));

					const float max_distance = 100.0f; // Adjust as needed
					auto result = svo.march(cast, max_distance);

					float distance = result.distance;

					glm::vec3 intersection_point = cast.get_origin() + cast.get_direction() * distance;

					if (result.hit && result.node->draw_turn != draw_turn)
					{
						result.node->draw_turn = draw_turn;
					}
				}
			}
		}

		svo.draw_node_buffer(camera.get_position(), camera.get_direction(), draw_turn);
		draw_turn++;
	}
};

int main()
{
	gfx::context context("voxel", 2560, 1440);

	entt::registry registry = entt::basic_registry();
	entt::dispatcher dispatcher;

	frame::framework framework(&context, registry, dispatcher);

	{
		context.input_mode(input::input_mode::StickyKeys, true);
		context.input_mode(input::input_mode::Cursor, GLFW_CURSOR_DISABLED);
	}

	{
		gfx::enable(gfx::enable_fields::CullFace);
		gfx::depth(gfx::depth_function::Less);
		gfx::clear_color({ 0.0, 0.1, 0.2, 0.0 });

		buffer::reserve_vertex_array(1);
	}

	listener list;

	svo::svo octree(glm::vec3(0.0, 0.0, 0.0), glm::vec3(1.0, 0.5, 0.5), 1.0);
	gfx::camera camera(projection::perspective, 90.0f, 0.1f, 10000.0f);

	movement move;

	registry.ctx().emplace<movement>();
	registry.ctx().emplace<svo::svo>(octree);
	registry.ctx().emplace<gfx::camera>(camera);
	registry.ctx().emplace<shader::shader>("shaders/simple.vert", "shaders/simple.frag");

	register_gui(dispatcher);
	register_input(dispatcher);

	auto tick_signal = dispatcher.sink<frame::tick_event>();

	tick_signal.connect<&listener::tick_svo>(list);

	framework.init_gui();
	framework.run();
}
