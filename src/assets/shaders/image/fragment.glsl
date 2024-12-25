// #ifdef GL_ES
// precision mediump float;
// #endif

// uniform vec2 u_resolution; // Screen resolution in pixels
// uniform vec2 u_mouse;      // Mouse position in pixels
// uniform float u_time;      // Elapsed time

// void main() {
//   // Normalize fragment coordinates (0.0 to 1.0 range)
// 	vec2 st = gl_FragCoord.xy / u_resolution;

//   // Normalize mouse coordinates (0.0 to 1.0 range)
//   vec2 mouse = u_mouse / u_resolution;

//   // time offset
//   float time = u_time * 0.2;
//   if (time > 1.0) {
//     time -= 0.5;
//   }
// 	// gl_FragColor = vec4(st.x*time,st.y*time,0.0,1.0);
//   gl_FragColor = vec4(st.x, st.y, 0.0, 1.0);
// }

precision mediump float;

void main() {
  gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
}