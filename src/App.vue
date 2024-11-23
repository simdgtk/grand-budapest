<script setup>
import HeroComponent from './components/HeroComponent.vue';
import ChaptersComponent from './components/ChaptersComponent.vue';
import ShaderSection from './components/ShaderSection.vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);


import Lenis from 'lenis';
const lenis = new Lenis({
  lerp: 0.07,
});

// lenis.on('scroll', (e) => {
//   console.log(e);
// });
lenis.on('scroll', ScrollTrigger.update);

// Add Lenis's requestAnimationFrame (raf) method to GSAP's ticker
// This ensures Lenis's smooth scroll animation updates on each GSAP tick
gsap.ticker.add((time) => {
  lenis.raf(time * 1000); // Convert time from seconds to milliseconds
});

// Disable lag smoothing in GSAP to prevent any delay in scroll animations
gsap.ticker.lagSmoothing(0);
</script>

<template>
  <main>
    <HeroComponent />
    <ChaptersComponent />
    <ShaderSection />
  </main>
</template>

<style scoped></style>
