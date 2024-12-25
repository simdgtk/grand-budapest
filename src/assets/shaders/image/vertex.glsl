// #define GLSLIFY 1
// // Texture varyings
// varying vec2 v_uv;

// /*
//  * The main program
//  */
// void main() {
//     // Calculate the varyings
//     v_uv = uv;

//     // Vertex shader output
//   gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 0.4);
// }

uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;

void main() {
  gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
  // gl_Position.x += 0.5;
}
