#version 450 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

layout (location = 4) in ivec4 boneIds;
layout (location = 5) in vec4 weights;

out vec3 v_normal;
out vec3 v_position;

out vec2 TexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

//const int MAX_BONES = 100;
//const int MAX_BONE_INFLUENCE = 4;
//uniform mat4 finalBonesMatrices[MAX_BONES];

void main()
{
//    vec4 totalPosition = vec4(0.0f);
//    for(int i = 0 ; i < MAX_BONE_INFLUENCE ; i++)
//    {
//        if(boneIds[i] == -1) 
//            continue;
//        if(boneIds[i] >=MAX_BONES) 
//        {
//            totalPosition = vec4(aPos, 1.0f);
//            break;
//        }
//        vec4 localPosition = finalBonesMatrices[boneIds[i]] * vec4(aPos, 1.0f);
//        totalPosition += localPosition * weights[i];
//        vec3 localNormal = mat3(finalBonesMatrices[boneIds[i]]) * aNormal;
//   }

    v_normal = mat3(transpose(inverse(view * model))) * aNormal;
    TexCoords = aTexCoords;    
    v_position = (view * model * vec4(aPos.xyz, 1.0f)).xyz;
    gl_Position = projection * view * model * vec4(aPos, 1.0);
}