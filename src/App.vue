<script setup>
import HeroComponent from './components/HeroComponent.vue';
import ChaptersComponent from './components/ChaptersComponent.vue';
import ShaderSection from './components/ShaderSection.vue';
import { gsap } from 'gsap';
import { onMounted, ref } from 'vue';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);


import Lenis from 'lenis';
import LoadingScreen from './components/LoadingScreen.vue';
import FooterSection from './components/FooterSection.vue';
const lenis = new Lenis({
  lerp: 0.07,
});


lenis.on('scroll', ScrollTrigger.update);

gsap.ticker.add((time) => {
  lenis.raf(time * 1000);
});

gsap.ticker.lagSmoothing(0);

// loading state
const isLoading = ref(true);
const lift = ref(false);
onMounted(() => {
  setTimeout(() => {
    lift.value = true;
  }, 4000)
  setTimeout(() => {
    isLoading.value = false;
  }, 5000);
});

</script>

<template>
  <main>
    <LoadingScreen v-if="isLoading" :lift="lift" />
    <div class="" v-else>
      <HeroComponent />
      <ChaptersComponent />
      <!-- <ShaderSection /> -->
      <FooterSection />
    </div>
  </main>
</template>

<style scoped></style>
