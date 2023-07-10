#include "camera.hpp"
#include "entt/entity/fwd.hpp"
#include "framework.hpp"
#include "render.hpp"
#include "shader.hpp"
#include "voxel/ray.hpp"
#include "voxel/svo.hpp"
#include <render_systems.hpp>

using namespace entt::literals;

struct listener {
	void tick_svo(const frame::tick_event &event)
	{
		auto registry = event.registry;
		auto framework = event.data;

		auto &draw_turn = registry->ctx().get<int>("draw_turn"_hs);
		auto &nodes_drawn = registry->ctx().get<int>("nodes_drawn"_hs);

		auto &camera = registry->ctx().get<gfx::camera>();

		auto &shader = registry->ctx().get<shader::shader>();
		auto &svo = registry->ctx().get<svo::svo>();

		gfx::clear(gfx::clear_buffer::Color | gfx::clear_buffer::Depth);
		shader.bind();

		nodes_drawn = 0;
		draw_turn += 1;

		{
			glm::vec3 player_position = camera.get_position();
			ray::raycast cast(player_position, camera.get_direction());

			cast.set_origin(player_position);

			const int min_yaw = -45, max_yaw = 45;
			const int min_pitch = -45, max_pitch = 45;

			const int multiplier = 500;
			const int near_yaw_step = 1;
			const int near_pitch_step = 1;

			for (int yaw = min_yaw; yaw <= max_yaw; yaw += near_yaw_step)
			{
				float horizontalAngle = glm::radians(static_cast<float>(yaw));

				for (int pitch = min_pitch; pitch <= max_pitch; pitch += near_pitch_step)
				{
					float verticalAngle = glm::radians(static_cast<float>(pitch));

					cast.set_direction(
							glm::rotate(glm::rotate(camera.get_direction(), verticalAngle * multiplier, glm::vec3(1.0f, 0.0f, 0.0f)),
									horizontalAngle * multiplier, glm::vec3(0.0f, 1.0f, 0.0f)));

					const float max_distance = 25.0f;
					auto result = svo.march(cast, max_distance);

					float distance = result.distance;

					glm::vec3 intersection_point = cast.get_origin() + cast.get_direction() * distance;

					if (result.hit && result.node->draw_turn != draw_turn)
					{
						result.node->set_draw_turn(draw_turn, 1000);
						nodes_drawn += 1;
					}
				}
			}
		}

		svo.draw_node_buffer(camera.get_position(), camera.get_direction(), 4, draw_turn);
	}
};

void register_renderer(entt::registry &registry, entt::dispatcher &dispatcher)
{
	registry.ctx().emplace_as<int>("draw_turn"_hs, 0);
	registry.ctx().emplace_as<int>("nodes_drawn"_hs, 0);

	dispatcher.sink<frame::tick_event>().connect<&listener::tick_svo>(listener {});
}
