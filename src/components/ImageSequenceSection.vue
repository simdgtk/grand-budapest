<script setup>
import { ref, onMounted } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

const canvas = ref(null);

onMounted(() => {
  const context = canvas.value.getContext("2d");
  // canvas.value.width = window.innerWidth * 0.8;
  // canvas.value.height = window.innerWidth * 540 / 960 * 0.8;
  canvas.value.width = 960;
  canvas.value.height = 540;

  const frameCount = 100;
  const images = [];
  const imageSequence = { frame: -300 };

  // Chargement des images via import.meta.glob pour Vite
  const imageModules = import.meta.glob('@/assets/image_sequence/*.webp', { eager: true });
  const sortedKeys = Object.keys(imageModules).sort();

  sortedKeys.forEach((key, index) => {
    const img = new Image();
    img.src = imageModules[key].default || imageModules[key];
    images[index] = img;
  });

  gsap.to(imageSequence, {
    frame: frameCount - 1,
    snap: "frame",
    ease: "none",
    scrollTrigger: {
      scrub: 0.5,
    },
    onUpdate: render, // Mise à jour lors de l'animation
  });

  images[0].onload = render;

  function render() {
    context.clearRect(0, 0, canvas.value.width, canvas.value.height);
    if (images[imageSequence.frame]) {
      context.drawImage(images[imageSequence.frame], 0, 0);
    }
  }
});
</script>

<template>
  <div class="image-sequence">
    <div class="image-sequence__main">
      <canvas class="image-sequence__main__canvas" ref="canvas" />
    </div>
    <!-- <div class="image-sequence__final-image">
      <img class="image-sequence__final-image-img" src="@/assets/image_sequence/0100.webp" alt="">
    </div> -->
  </div>
</template>

<style lang="scss">
.image-sequence {
  position: relative;
}

.image-sequence__final-image {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  z-index: -1;
}

.image-sequence__main,
.image-sequence__final-image {
  min-height: 100vw;
  height: 200vh;
  display: flex;
  justify-content: center;
  max-width: 100%;
  position: relative;

  &__canvas,
  &__final-image {
    position: sticky;
    top: 0;
    // max-width: 100%;
    // max-height: 90vh;
    width: 75vw;
    height: calc(75vw * 540 / 960);

    @media screen and (max-width: 960px) {
      width: 100vw;
      height: calc(100vw * 540 / 960);
    }

    // width: 960px;
    // height: 540px;
    // height: 100vh;
    // margin: 0 auto;
    // transform: translate(25%, 0%);

    background-position: center;
    mask: linear-gradient(to right, transparent 2%, #fff 7% 70%, transparent 95%),
    linear-gradient(to left, transparent 2%, #fff 7% 70%, transparent 95%);
    mask-size: 110% 110%;
    mask-position: center;
    mask-repeat: no-repeat;
    mask-composite: intersect;
    // transform: translateY(-10rem);
  }

  // &__final-image {
  //   position: absolute;
  //   top: 0;
  //   left: 0;
  //   width: 100%;
  //   height: 100%;
  //   object-fit: cover;
  //   z-index: -1;
  // }
}
</style>
