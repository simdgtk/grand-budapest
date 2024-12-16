import { fileURLToPath, URL } from "node:url";

import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import vueDevTools from "vite-plugin-vue-devtools";
import glsl from "vite-plugin-glsl";


// https://vite.dev/config/
export default defineConfig({
  plugins: [vue(), vueDevTools(), glsl()],
  css: {
    preprocessorOptions: {
      scss: {
        additionalData: `@use "src/styles/shared.scss" as *;`,
        silenceDeprecations: ["legacy-js-api"],
      },
    },
  },
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("./src", import.meta.url)),
    },
  },
});
