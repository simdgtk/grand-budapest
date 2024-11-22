<template>
  <div class="section">
    <h2>Chapitres</h2>
    <div class="images-grid main-grid" ref="grid">
      <div class="text-image first">
        <div class="text-image first">
          <div class="img-container">
            <img class="img" ref="first" loading="lazy" src="@/assets/images/chap1.webp"
              alt="Chapter 1 Grand Budapest hotel" width="auto" height="499" />
          </div>
          <h3>Chapitre 1.</h3>
          <p class="text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Excepturi voluptates, tempore esse
            exercitationem
            ipsum alias vel porro repellendus odio aliquam fugit unde eum suscipit soluta temporibus laborum quos
            officiis
            aperiam.</p>
        </div>
      </div>
      <div class="text-image second">
        <div class="img-container">
          <img class="img" ref="second" loading="lazy" src="@/assets/images/chap2.webp"
            alt="Chapter 2 Grand Budapest hotel" width="auto" height="254" />
        </div>
        <h3>Chapitre 2.</h3>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Excepturi voluptates, tempore esse exercitationem
          ipsum alias vel porro repellendus odio aliquam fugit unde eum suscipit soluta temporibus laborum quos officiis
          aperiam.</p>
      </div>
      <div class="text-image third">
        <div class="img-container img-draggable">
          <div class="images" ref="third">
            <img class="img" loading="lazy" src="@/assets/images/chap3.webp" alt="Chapter 3 Grand Budapest hotel"
              width="auto" height="443" />
            <img class="img2" ref="draggable" src="@/assets/images/chap3_boy_with_apple.webp"
              alt="Boy with Apple, fictional painting" width="auto" height="116" />
          </div>
        </div>
        <!-- <div class="img-container img-draggable"> -->
        <!-- <div class="images">
            <img ref="third" loading="lazy" src="@/assets/images/chap3.webp" alt="Chapter 3 Grand Budapest hotel"
              width="auto" height="443" />
            <img ref="third2" src="@/assets/images/chap3_boy_with_apple.webp" alt="Boy with Apple, fictional painting"
              width="auto" height="116" />
          </div> -->
        <!-- </div> -->
        <h3 style="margin-top: 0.9rem;">Chapitre 3.</h3>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Excepturi voluptates, tempore esse exercitationem
          ipsum alias vel porro repellendus odio aliquam fugit unde eum suscipit soluta temporibus laborum quos
          officiis
          aperiam.</p>
      </div>
      <div class="text-image fourth">
        <div class="img-container">
          <img class="img" ref="fourth" loading="lazy" src="@/assets/images/chap4.webp"
            alt="Chapter 4 Grand Budapest hotel" width="auto" height="332" />
        </div>
        <h3>Chapitre 4.</h3>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Excepturi voluptates, tempore esse exercitationem
          ipsum alias vel porro repellendus odio aliquam fugit unde eum suscipit soluta temporibus laborum quos
          officiis
          aperiam.</p>
      </div>
      <div class="text-image fifth">
        <div class="img-container">
          <img class="img" ref="fifth" loading="lazy" src="@/assets/images/chap5.webp"
            alt="Chapter 5 Grand Budapest hotel" width="auto" height="332" />
        </div>
        <h3>Chapitre 5.</h3>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Excepturi voluptates, tempore esse exercitationem
          ipsum alias vel porro repellendus odio aliquam fugit unde eum suscipit soluta temporibus laborum quos
          officiis
          aperiam.</p>
      </div>
      <!-- <div class="text-image">
        <div class="img-container">
          <img loading="lazy" src="@/assets/images/chap1.webp" alt="Chapter 1 Grand Budapest hotel" width="499" height="499" />
        </div>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Excepturi voluptates, tempore esse exercitationem
          ipsum alias vel porro repellendus odio aliquam fugit unde eum suscipit soluta temporibus laborum quos officiis
          aperiam.</p>
      </div> -->
    </div>
  </div>
</template>
<script setup>
import Lenis from 'lenis';
import { gsap } from "gsap";
import { ref, onMounted } from 'vue';

import { ScrollTrigger } from "gsap/ScrollTrigger";
import { Draggable } from "gsap/Draggable";


gsap.registerPlugin(ScrollTrigger, Draggable);

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

const first = ref(null);
const second = ref(null);
const third = ref(null);
const third2 = ref(null);
const draggable = ref(null);

const fourth = ref(null);
const fifth = ref(null);

const grid = ref(null);
onMounted(() => {
  gsap.to([first.value, second.value, third.value, third2.value], {
    scrollTrigger: {
      trigger: grid.value,
      start: "top center",
      end: "center center",
      scrub: 0.5,
      markers: true,
    },
    transform: "scale(1) translateY(0)",
    y: 100,
  });

  gsap.to([fourth.value, fifth.value], {
    scrollTrigger: {
      trigger: grid.value,
      start: "center center",
      end: "bottom top",
      scrub: 0.5,
      markers: true,
    },
    transform: "scale(1)",
    y: 100,
  });

  // draggable painting
  Draggable.create(draggable.value, {
    bounds: { top: 0, left: 0, width: third.value.offsetWidth, height: third.value.offsetWidth - third.value.offsetWidth * 0.07 / 2 },
    inertia: true,
  });
})
</script>
<style scoped lang="scss">
.section {
  margin-top: 1rem;
}

p {
  line-height: 135%;
}

h3,
p,
h2 {
  @media screen and (max-width: 600px) {
    padding: 0 0.5rem;
  }
}

.images-grid {
  gap: 16rem 2rem;

  @media screen and (max-width: 900px) {
    gap: 8rem 1rem;
  }

  .text-image {
    display: flex;
    flex-direction: column;

    .img-container {
      margin-top: 1rem;
      overflow: hidden;

      &.img-draggable {
        position: relative;

        img:last-of-type {
          position: absolute;
          width: 22%;
          height: auto;
          top: 8%;
          left: 39.2%;
          cursor: grab;
        }
      }
    }


    .img {
      width: 100%;
      height: 100%;

      // gsap
      transform: scale(1.07) translateY(-7%);
    }


    .images {
      width: 100%;
      height: 100%;

      // gsap
      transform: scale(1.07) translateY(-7%);
    }

    h3 {
      margin-top: 1.7rem;
    }

    p {
      margin-top: 0.2rem;
    }

    &.first {
      grid-column: span 5;

      @media screen and (max-width: 900px) {
        grid-column: span 7;
      }

      @media screen and (max-width: 600px) {
        grid-column: span 12;
      }

    }

    &.second {
      grid-column: span 3;

      @media screen and (max-width: 900px) {
        grid-column: span 5;
      }

      @media screen and (max-width: 600px) {
        grid-column: span 12;
      }
    }

    &.third {
      grid-column: span 4;

      @media screen and (max-width: 600px) {
        grid-column: span 12;
      }
    }

    &.fourth {
      grid-column: span 5;

      @media screen and (max-width: 900px) {
        grid-column: span 8;
      }

      @media screen and (max-width: 600px) {
        grid-column: span 12;
      }
    }

    &.fifth {
      grid-column: span 7;

      @media screen and (max-width: 900px) {
        grid-column: span 12;
      }
    }
  }
}
</style>