<script setup>
import { ref, onMounted } from 'vue';
import { gsap } from "gsap";
import SplitType from 'split-type';
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { Draggable } from "gsap/Draggable";


gsap.registerPlugin(ScrollTrigger, Draggable);

const first = ref(null);
const second = ref(null);
const third = ref(null);
const third2 = ref(null);
const draggable = ref(null);

const fourth = ref(null);
const fifth = ref(null);

const grid = ref(null);
// texts animation

const animation = (paragraph) => {
  const textParagraphs = new SplitType(`.paragraph${paragraph}`, { types: 'words, chars' });
  gsap.fromTo(
    textParagraphs.chars,
    { y: '180%' },
    {
      y: '0%',
      duration: 0.8,
      ease: 'power3.inOut',
      stagger: 0.004,
    }
  );
}
onMounted(() => {
  gsap.to([first.value, second.value, third.value, third2.value], {
    scrollTrigger: {
      trigger: grid.value,
      start: "top center",
      end: "center center",
      scrub: 0.5,
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
const chapter = ref(null);
</script>

<template>
  <div class="section">
    <h2>Chapitres</h2>
    <div class="images-grid main-grid" ref="grid">
      <div class="text-image first">
        <div class="text-image first" @mouseleave="chapter = null">
          <div class="img-container">
            <img class="img" ref="first" src="@/assets/images/chap1.webp" alt="Chapter 1 Grand Budapest hotel"
              width="auto" height="499" @mouseover="chapter = 1; animation(1)" />
          </div>
          <h3 :class="chapter !== 1 ? 'none' : ''">Chapitre 1.</h3>
          <p :class="chapter !== 1 ? 'none paragraph1' : 'paragraph1'">C'est une bonne situation ça scribe ? Vous savez
            je ne pense pas moi que il y ait de bonnes ou de mauvaises situations. Si je devais résumer ma vie je dirais
            que c'est avant tout des rencontres, des.</p>
        </div>
      </div>
      <div class="text-image second" @mouseleave="chapter = null">
        <div class="img-container">
          <img class="img" ref="second" src="@/assets/images/chap2.webp" alt="Chapter 2 Grand Budapest hotel"
            width="auto" height="254" @mouseover="chapter = 2; animation(2)" />
        </div>
        <h3 :class="chapter !== 2 ? 'none' : ''">Chapitre 2.</h3>
        <p :class="chapter !== 2 ? 'none paragraph2' : 'paragraph2'">Lorem ipsum dolor sit, amet consectetur adipisicing
          elit. Excepturi
          voluptates,
          tempore esse exercitationem
          ipsum alias vel porro repellendus odio aliquam fugit unde eum suscipit soluta temporibus laborum quos officiis
          aperiam.</p>
      </div>
      <div class="text-image third" @mouseleave="chapter = null">
        <div class="img-container img-draggable">
          <div class="images" ref="third">
            <img class="img" src="@/assets/images/chap3.webp" alt="Chapter 3 Grand Budapest hotel" width="auto"
              height="443" @mouseover="chapter = 3; animation(3)" />
            <img class="img2" ref="draggable" src="@/assets/images/chap3_boy_with_apple.webp"
              alt="Boy with Apple, fictional painting" width="auto" height="116" />
          </div>
        </div>
        <h3 :class="chapter !== 3 ? 'none' : ''" style="margin-top: 0.9rem;">Chapitre 3.</h3>
        <p :class="chapter !== 3 ? 'none paragraph3' : 'paragraph3'">Lorem ipsum dolor sit, amet consectetur adipisicing
          elit. Excepturi voluptates,
          tempore esse exercitationem
          ipsum alias vel porro repellendus odio aliquam fugit unde eum suscipit soluta temporibus laborum quos
          officiis
          aperiam.</p>
      </div>
      <div class="text-image fourth" @mouseleave="chapter = null">
        <div class="img-container">
          <img class="img" ref="fourth" src="@/assets/images/chap4.webp" alt="Chapter 4 Grand Budapest hotel"
            width="auto" height="332" @mouseover="chapter = 4; animation(4)" />
        </div>
        <h3 :class="chapter !== 4 ? 'none' : ''">Chapitre 4.</h3>
        <p :class="chapter !== 4 ? 'none paragraph4' : 'paragraph4'">Lorem ipsum dolor sit, amet consectetur adipisicing
          elit. Excepturi voluptates,
          tempore esse exercitationem
          ipsum alias vel porro repellendus odio aliquam fugit unde eum suscipit soluta temporibus laborum quos
          officiis
          aperiam.</p>
      </div>
      <div class="text-image fifth" @mouseleave="chapter = null">
        <div class="img-container">
          <img class="img" ref="fifth" src="@/assets/images/chap5.webp" alt="Chapter 5 Grand Budapest hotel"
            width="auto" height="332" @mouseover="chapter = 5; animation(5)" />
        </div>
        <h3 :class="chapter !== 5 ? 'none' : ''">Chapitre 5.</h3>
        <p :class="chapter !== 5 ? 'none paragraph5' : 'paragraph5'">Lorem ipsum dolor sit amet consectetur, adipisicing
          elit. Atque, illum, necessitatibus recusandae alias quasi
          fugit omnis mollitia ipsam cupiditate laboriosam iusto fuga porro itaque. Voluptates voluptatum labore
          reiciendis a recusandae.</p>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
::v-deep(.word) {
  overflow: hidden;
  display: inline-block;
}

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

    .none {
      opacity: 0;
    }

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
      transition: opacity 0.2s ease-in-out;
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