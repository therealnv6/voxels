#include "info.hpp"
#include <camera.hpp>
#include <entity.hpp>
#include <glm/gtx/string_cast.hpp>
#include <render.hpp>
#include <ui.hpp>

#include <framework.hpp>

class ui_listener
{
public:
	void update_gui(const frame::tick_event &event)
	{
		event.data->gui_frame();

		auto registry = event.registry;

		auto &move = registry->ctx().get<movement>();
		auto &camera = registry->ctx().get<gfx::camera>();

		frame::frame_history history = event.data->frame.frameHistory;

		{
			ImGuiIO &io = ImGui::GetIO();
			(void) io;

			float total_mem_gb = info::get_memory(memory_type::available_memory, memory_scale::gigabytes);
			float total_mem_mb = info::get_memory(memory_type::available_memory, memory_scale::megabytes);
			float cur_avail_mem_mb = info::get_memory(memory_type::free_space, memory_scale::megabytes);

			ImGui::Begin("ogl voxel");

			if (ImGui::BeginTabBar(""))
			{
				if (ImGui::BeginTabItem("Debug"))
				{
					ImGui::PlotLines("", history.frames.data(), history.max_frames);
					ImGui::Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f / io.Framerate, io.Framerate);
					ImGui::Text("Memory usage %.2f/%.3f MB", total_mem_mb - cur_avail_mem_mb, total_mem_gb);

					ImGui::Text("camera.get_direction(): %s", glm::to_string(camera.get_direction()).c_str());

					ImGui::Text("horizontalAngle: %.3f", move.horizontalAngle);
					ImGui::SameLine();
					ImGui::Text("verticalAngle: %.3f", move.verticalAngle);

					ImGui::InputFloat("= x", &move.position.x);
					ImGui::InputFloat("= y", &move.position.y);
					ImGui::InputFloat("= z", &move.position.z);

					ImGui::EndTabItem();
				}

				if (ImGui::BeginTabItem("Controls"))
				{
					ImGui::EndTabItem();
				}

				ImGui::EndTabBar();
			}

			ImGui::End();
		}
	}
};

void register_gui(entt::dispatcher &dispatcher)
{
	dispatcher.sink<frame::tick_event>().connect<&ui_listener::update_gui>(ui_listener {});
}
