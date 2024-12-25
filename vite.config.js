import { fileURLToPath, URL } from "node:url";
import glsl from "vite-plugin-glsl";
import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import vueDevTools from "vite-plugin-vue-devtools";

export default defineConfig({
  plugins: [vue(), vueDevTools(), glsl()],
  css: {
    preprocessorOptions: {
      scss: {
        additionalData: `@use "src/styles/shared.scss" as *;`, // Partage les styles SCSS
      },
    },
  },
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("./src", import.meta.url)), // Alias vers le dossier src
    },
  },
});
