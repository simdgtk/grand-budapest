<script setup>
import { ref, onMounted } from 'vue';
import * as THREE from 'three';

const containerRef = ref(null);

onMounted(() => {
  if (containerRef.value) {
    // Scène, caméra, rendu Three.js
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    const renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    containerRef.value.appendChild(renderer.domElement);

    const material = new THREE.ShaderMaterial({
      vertexShader: `
        void main() {
          gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
        }
      `,
      fragmentShader: `
        void main() {
          gl_FragColor = vec4(1.0, 1.0, 0.0, 1.0); // Couleur verte
        }
      `,
    });

    const geometry = new THREE.PlaneGeometry(3, 3);
    const sphere = new THREE.Mesh(geometry, material);
    scene.add(sphere);

    camera.position.z = 5;

    function animate() {
      requestAnimationFrame(animate);

      // sphere.rotation.x += 0.01;
      // sphere.rotation.y += 0.01;

      renderer.render(scene, camera);
    }
    animate();
  }
});
</script>

<template>
  <!-- <div ref="containerRef" class="section"> -->
    <div class="main-grid" ref="containerRef">
      <!-- Le rendu Three.js sera injecté ici -->
    </div>
  <!-- </div> -->
</template>

<style scoped lang="scss">
// .section {
//   margin: 0;
//   width: 100vw;
//   height: 100vh;
// }

.main-grid {
  width: 100vw;
  height: 100vh;
  position: relative;
  top: 0;
  left: 0;
}
</style>
