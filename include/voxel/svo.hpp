#pragma once
#include <buffer.hpp>
#include <glm/glm.hpp>
#include <render.hpp>
#include <unordered_set>
#include <voxel/ray.hpp>

namespace svo
{
	struct voxel {
		glm::vec3 position;
		glm::vec3 color;
		float size;
	};

	struct node {
		voxel voxels[8];
		node *children[8] = { nullptr };
	};

	struct march_result {
		bool hit = false;
		float distance;
		const svo::voxel *voxel;
		const svo::node *node;
	};

	typedef std::vector<voxel> voxel_set;

	class grid_buffer
	{
	private:
		buffer::buffer *vertex_buffer;
		buffer::buffer *color_buffer;
		buffer::buffer *index_buffer;

	public:
		grid_buffer(glm::vec3 bounds)
		{
			vertex_buffer = new buffer::buffer(nullptr, 0, draw_type::dynamic_draw, buffer_type::array);
			color_buffer = new buffer::buffer(nullptr, 0, draw_type::dynamic_draw, buffer_type::array);
			index_buffer = new buffer::buffer(nullptr, 0, draw_type::dynamic_draw, buffer_type::array);
		}

		void update_buffers(voxel_set data)
		{
			const size_t cube_vertex_count = 36;
			size_t max_buffer_size = data.size();
			size_t type_size = sizeof(glm::vec3);

			// Resize the buffers and allocate memory
			vertex_buffer->resize(cube_vertex_count * max_buffer_size * type_size);
			color_buffer->resize(cube_vertex_count * max_buffer_size * type_size);
			index_buffer->resize(cube_vertex_count * max_buffer_size * sizeof(unsigned int));

			unsigned int *indices = new unsigned int[cube_vertex_count * max_buffer_size];

			int vertex_index = 0;
			int index_offset = 0;

			for (auto voxel : data)
			{
				const float half_size = voxel.size / 2;
				glm::vec3 center = voxel.position;

				// Define the vertices for the cube
				glm::vec3 vertices[] = {
					center + glm::vec3(-half_size, -half_size, -half_size),
					center + glm::vec3(half_size, -half_size, -half_size),
					center + glm::vec3(half_size, half_size, -half_size),
					center + glm::vec3(-half_size, half_size, -half_size),
					center + glm::vec3(-half_size, -half_size, half_size),
					center + glm::vec3(half_size, -half_size, half_size),
					center + glm::vec3(half_size, half_size, half_size),
					center + glm::vec3(-half_size, half_size, half_size)
				};

				// Define the indices for the cube
				unsigned int cube_indices[] = {
					0, 1, 2, 2, 3, 0, // front face
					1, 5, 6, 6, 2, 1, // right face
					5, 4, 7, 7, 6, 5, // back face
					4, 0, 3, 3, 7, 4, // left face
					3, 2, 6, 6, 7, 3, // top face
					4, 5, 1, 1, 0, 4 // bottom face
				};

				for (int i = 0; i < cube_vertex_count; i++)
				{
					glm::vec3 location = vertices[cube_indices[i]];

					vertex_buffer->write(reinterpret_cast<void *>(&location), type_size, vertex_index * type_size);
					color_buffer->write(reinterpret_cast<void *>(&voxel.color), type_size, vertex_index * type_size);

					indices[index_offset + i] = vertex_index;
					vertex_index++;
				}

				index_offset += cube_vertex_count;
			}

			// Update the index buffer with the new indices
			index_buffer->update(reinterpret_cast<void *>(indices));

			delete[] indices;
		}

		void draw()
		{
			if (vertex_buffer->get_size() != 0)
			{
				vertex_buffer->bind_vertex(0, 3);
				color_buffer->bind_vertex(1, 3);
				index_buffer->bind_indices();

				gfx::draw_elements(index_buffer->get_size());
				gfx::draw_arrays(0, vertex_buffer->get_size());
			}
		}
	};

	class svo
	{
	public:
		/**
		 * Constructs an SVO with a root voxel.
		 *
		 * @param position   The position of the root voxel.
		 * @param color      The color of the root voxel.
		 * @param root_size  The size of the root voxel.
		 *
		 * @remarks This constructor initializes the SVO with a root voxel at the specified position, color, and size.
		 */
		svo(const glm::vec3 &position, const glm::vec3 &color, float root_size)
			: buffer(glm::vec3(128.0, 128.0, 128.0))
		{
			root = new node();
			root->voxels[0] = voxel { position, color, root_size };
		}

		/**
		 * Subdivides a node into eight children nodes.
		 *
		 * @param node  The node to subdivide.
		 *
		 * @remarks This function subdivides the specified
		 *          node into eight children nodes.
		 */
		void subdivide_node(node *node)
		{
			const glm::vec3 &parent_pos = node->voxels[0].position;

			float parent_size = node->voxels[0].size;
			float child_size = parent_size / 2;

			glm::vec3 child_color = node->voxels[0].color;

			for (int i = 0; i < 8; i++)
			{
				glm::vec3 child_position = parent_pos;
				child_position.x += (i & 1) ? child_size : -child_size;
				child_position.y += (i & 2) ? child_size : -child_size;
				child_position.z += (i & 4) ? child_size : -child_size;

				node->children[i] = new class node();
				node->children[i]->voxels[0] = voxel { child_position, child_color, child_size };
			}
		}

		/**
		 * Constructs the octree recursively by subdividing nodes.
		 *
		 * @remarks This function constructs the octree recursively by subdividing nodes
		 *          until the minimum voxel size is reached.
		 */
		void construct_octree()
		{
			construct_octree_recursive(root);
		}

		/**
		 * Constructs the octree recursively by subdividing nodes.
		 *
		 * @param node  The current node being processed.
		 *
		 * @remarks This function constructs the octree recursively
		 *          by subdividing nodes until the minimum voxel size
		 *          for the sparse voxel octree is reached.
		 */
		void construct_octree_recursive(node *node)
		{
			if (node->voxels[0].size <= min_voxel_size)
			{
				return;
			}

			subdivide_node(node);

			for (int i = 0; i < 8; i++)
			{
				if (node->children[i])
				{
					construct_octree_recursive(node->children[i]);
				}
			}
		}

		march_result march(ray::raycast &ray, float max_distance) const
		{
			return march_recursive(ray, max_distance, root);
		}

		/**
		 * Performs ray marching recursively through the octree to find the distance to the nearest surface.
		 *
		 * @param ray           The ray to march.
		 * @param max_distance  The maximum distance to march.
		 * @param node          The current node being processed.
		 * @return The distance to the nearest surface.
		 *
		 * @remarks This function performs ray marching recursively
		 *          through the octree to find the distance to the nearest surface.
		 */
		march_result march_recursive(ray::raycast &ray, float max_distance, const node *node) const
		{
			march_result result;
			result.distance = std::numeric_limits<float>::max();
			result.node = nullptr;

			if (!node->children[0])
			{
				for (int i = 0; i < 8; i++)
				{
					const auto &voxel = node->voxels[i];
					if (voxel.size > 0.0f)
					{
						float t = ray.intersect_cube(voxel.position, voxel.size);
						if (t >= 0.0f && t < result.distance)
						{
							result.distance = t;
							result.hit = true;
							result.node = node;
							result.voxel = &voxel;
						}
					}
				}
			}
			else
			{
				for (int i = 0; i < 8; i++)
				{
					const auto &child = node->children[i];
					if (child)
					{
						float t = ray.intersect_cube(child->voxels[0].position, child->voxels[0].size);
						if (t >= 0.0f && t < result.distance)
						{
							result.distance = t;
							result.node = child;

							ray.set_origin(ray.get_origin() + ray.get_direction() * t);

							march_result child_result = march_recursive(ray, max_distance - t, child);

							if (child_result.node != nullptr)
							{
								result.distance += child_result.distance;
								break;
							}
						}
					}
				}
			}

			return result;
		}
		int count_voxels(const node *node)
		{
			if (!node)
			{
				return 0;
			}

			int count = 1;

			for (int i = 0; i < 8; i++)
			{
				count += count_voxels(node->children[i]);
			}

			return count;
		}

		void flatten_octree(const node *node, std::vector<voxel> &voxelData, int &currentIndex)
		{
			if (!node)
			{
				return;
			}

			voxelData[currentIndex] = node->voxels[0];
			currentIndex++;

			for (int i = 0; i < 8; i++)
			{
				flatten_octree(node->children[i], voxelData, currentIndex);
			}
		}

		void bind_to_gpu(buffer::buffer *buffer)
		{
			int numVoxels = count_voxels(root);
			int current = 0;

			std::vector<voxel> voxelData(numVoxels);
			flatten_octree(root, voxelData, current);

			buffer->write(voxelData.data(), sizeof(voxel) * numVoxels, 0);
		}

		void update_buffer(voxel_set data)
		{
			this->buffer.update_buffers(data);
		}

		void draw_buffer()
		{
			this->buffer.draw();
		}

	private:
		node *root;
		float min_voxel_size = 0.01f;
		grid_buffer buffer;
	};
};
