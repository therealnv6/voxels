#pragma once
#include <glm/glm.hpp>

struct movement {
	glm::vec3 position = glm::vec3(0, 0, 0);

	float horizontalAngle = 0.0f;
	float verticalAngle = 0.0f;
};
