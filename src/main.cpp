#include "entt/signal/fwd.hpp"
#include "render.hpp"
#include "render_systems.hpp"
#include <camera.hpp>
#include <entity.hpp>
#include <framework.hpp>
#include <glm/gtx/string_cast.hpp>
#include <movement.hpp>
#include <render.hpp>
#include <shader.hpp>
#include <spdlog/common.h>
#include <spdlog/spdlog.h>
#include <ui.hpp>
#include <voxel/ray.hpp>
#include <voxel/svo.hpp>
#include <window.hpp>

using namespace entt::literals;

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

	svo::svo octree(glm::vec3(0.0, 0.0, 0.0), glm::vec3(1.0, 0.5, 0.5), 1.0);
	gfx::camera camera(projection::perspective, 90.0f, 0.1f, 10000.0f);

	octree.construct_octree();
	octree.subdivide_recursively(octree.root, 4);

	movement move;

	registry.ctx().emplace<movement>();
	registry.ctx().emplace<svo::svo>(octree);
	registry.ctx().emplace<gfx::camera>(camera);
	registry.ctx().emplace<shader::shader>("shaders/simple.vert", "shaders/simple.frag");

	register_renderer(registry, dispatcher);
	register_gui(dispatcher);
	register_input(dispatcher);

	framework.init_gui();
	framework.run();
}
