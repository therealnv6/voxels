#include <camera.hpp>
#include <entity.hpp>
#include <framework.hpp>
#include <glm/glm.hpp>
#include <glm/gtx/string_cast.hpp>
#include <movement.hpp>
#include <shader.hpp>

const static float MOVEMENT_SPEED = 30.0f;
const static float MOUSE_SPEED = 150.0f;

struct poll_input_event {
	entt::registry *registry;
	frame::framework *framework;
};

class movement_listener
{
public:
	void update_camera(const frame::tick_event &event)
	{
		auto registry = event.registry;
		auto framework = event.data;

		auto &move = registry->ctx().get<movement>();
		auto &camera = registry->ctx().get<gfx::camera>();

		auto &shader = registry->ctx().get<shader::shader>();

		{
			camera.move(move.position);

			auto projection = camera.get_projection();
			auto view = camera.get_view_matrix();

			if (ImGui::GetCurrentContext() == nullptr || !ImGui::IsWindowFocused(ImGuiFocusedFlags_AnyWindow))
			{
				framework->dispatcher.trigger(
					poll_input_event { registry, framework } // we could probably make a single poll_input_event instead of making a new one.
				);
			}

			glm::mat4 model = glm::mat4(1.0f);
			glm::mat4 mvp = (projection * view * model);

			shader.bind_mat4("mvp", mvp, false);
		}
	}

	void input(const poll_input_event &event)
	{
		auto registry = event.registry;
		auto framework = event.framework;

		if (framework->is_pressed(input::key::esc))
		{
			return; // we don't want to handle any of the other input (e.g. resetting the mouse)
		}

		static double i = 0.0;

		if (i < 0.5)
		{
			i += 0.1;
			return;
		}

		auto [width, height] = framework->context->size();
		auto [xpos, ypos] = framework->context->get_mouse_pos();

		framework->context->reset_mouse();

		float mouseDeltaX = static_cast<float>(width / 2.0 - xpos);
		float mouseDeltaY = static_cast<float>(height / 2.0 - ypos);

		auto &camera = registry->ctx().get<gfx::camera>();
		auto &move = registry->ctx().get<movement>();

		{
			float deltaX = MOUSE_SPEED * framework->frame.deltaTime * mouseDeltaX;
			float deltaY = MOUSE_SPEED * framework->frame.deltaTime * mouseDeltaY;

			// Update the camera rotation angles based on the mouse movement
			move.horizontalAngle += deltaX;
			move.verticalAngle += deltaY;

			// Limit the vertical angle to a certain range to prevent camera flipping
			move.verticalAngle = glm::clamp(move.verticalAngle, -90.0f, 90.0f);
			camera.rotate_to(move.horizontalAngle, -move.verticalAngle);

			// yikes (should change this sometime)
			glm::vec3 direction = camera.get_direction();
			glm::vec3 right = glm::normalize(glm::cross(direction, camera.get_up()));

			// Define the key-to-direction mapping
			std::map<input::key, glm::vec3> keyToDirection {
				{ input::key::w, direction }, // Forwards
				{ input::key::a, -right }, // Left
				{ input::key::s, -direction }, // Backwards
				{ input::key::d, right }, // Right
				{ input::key::spacebar, glm::vec3(0.0f, 1.0f, 0.0f) }, // Up
				{ input::key::shift, glm::vec3(0.0f, -1.0f, 0.0f) }	// Down
			};

			for (const auto &entry : keyToDirection)
			{
				if (framework->is_pressed(entry.first))
				{
					move.position += entry.second * MOVEMENT_SPEED * framework->frame.deltaTime;
				}
			}
		}
	}
};

void register_input(entt::dispatcher &dispatcher)
{
	movement_listener listener;

	dispatcher.sink<frame::tick_event>().connect<&movement_listener::update_camera>(listener);
	dispatcher.sink<poll_input_event>().connect<&movement_listener::input>(listener);
}
