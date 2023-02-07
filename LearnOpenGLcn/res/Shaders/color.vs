#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec2 TexCoords;
out vec3 FragPos;
out vec3 Normal;

void main()
{
	FragPos = vec3(model * vec4(aPos, 1.0));
	Normal = mat3(transpose(inverse(model))) * aNormal;//把法向量也转换为世界空间坐标,法线矩阵被定义为「模型矩阵左上角3x3部分的逆矩阵的转置矩阵」
	gl_Position = projection * view  * vec4(FragPos, 1.0);
	TexCoords = aTexCoords;
}