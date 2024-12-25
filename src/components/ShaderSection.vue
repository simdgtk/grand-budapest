<script setup>
import { ref, onMounted } from 'vue';
import * as THREE from 'three';
import vertexShader from '@/assets/shaders/image/vertex.glsl';
import fragmentShader from '@/assets/shaders/image/fragment.glsl';
import { EffectComposer } from 'three/addons/postprocessing/EffectComposer.js';
import { RenderPass } from 'three/addons/postprocessing/RenderPass.js';

const containerRef = ref(null);

onMounted(() => {
  if (containerRef.value) {
    const scene = new THREE.Scene();
    const clock = new THREE.Clock();
    const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    const renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(window.innerWidth, window.innerHeight);
    containerRef.value.appendChild(renderer.domElement);

    // Matériau personnalisé avec shaders
    const material = new THREE.RawShaderMaterial({
      vertexShader,
      fragmentShader,
      uniforms: {
        u_time: { value: 0.0 },
        u_mouse: { value: new THREE.Vector2() },
        u_resolution: {
          type: "v2",
          value: new THREE.Vector2(window.innerWidth, window.innerHeight)
            .multiplyScalar(window.devicePixelRatio)
        },
      },
    });

    material.uniforms.u_resolution.value.set(window.innerWidth, window.innerHeight);
    // Géométrie et ajout à la scène
    const geometry = new THREE.PlaneGeometry(3, 3);
    const planeMesh = new THREE.Mesh(geometry, material);
    scene.add(planeMesh);

    camera.position.z = 5;

    // Gestion des événements de la souris
    window.addEventListener('mousemove', (event) => {
      material.uniforms.u_mouse.value.set(event.clientX, window.innerHeight - event.clientY);
    });

    // Gestion du redimensionnement de la fenêtre
    const handleResize = () => {
      const { innerWidth, innerHeight } = window;
      renderer.setSize(innerWidth, innerHeight);
      renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
      renderer.outputEncoding = THREE.sRGBEncoding;
      camera.aspect = innerWidth / innerHeight;
      camera.updateProjectionMatrix();
      material.uniforms.u_resolution.value.set(innerWidth, innerHeight);
    };

    window.addEventListener('resize', handleResize);

    // Post-traitement avec EffectComposer
    const composer = new EffectComposer(renderer);
    const renderPass = new RenderPass(scene, camera);
    composer.addPass(renderPass);

    // Animation
    const animate = () => {
      material.uniforms.u_time.value += clock.getDelta();
      requestAnimationFrame(animate);
      composer.render();
    };

    animate();
  }
});
</script>

<template>
  <div class="main-grid" ref="containerRef">
    <!-- Le rendu Three.js sera injecté ici -->
  </div>
</template>

<style scoped lang="scss">
.main-grid {
  width: 100vw;
  height: 100vh;
  position: relative;
  top: 0;
  left: 0;
}
</style>