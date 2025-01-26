<template>
  <div class="section">
    <h2>Chapitres</h2>
    <div class="grid main-grid" ref="grid">
      <div class="text-image first">
        <div class="text-image first" @mouseleave="chapter = null">
          <div class="img-container">
            <img class="img" ref="first" src="@/assets/images/chap1.webp" alt="Chapter 1 Grand Budapest hotel"
              loading="lazy" width="auto" height="499" @mouseover="chapter = 1; animation(1)" />
          </div>
          <h3 :class="chapter !== 1 ? 'none' : ''">Retour en arrière</h3>
          <p :class="chapter !== 1 ? 'none paragraph1' : 'paragraph1'">Le film débute sur une fille, lisant à sa
            sépulture un des livres d'un auteur décédé. L'auteur y raconte l'histoire du grand Budapest Hôtel, qu'il a découvert dans sa jeunesse. Il l'a trouvé usé par le temps et il va y rencontrer son propriétaire Zero Moustafa, qui lui raconte comment, fût un temps, l'hôtel était splendide et important.</p>
        </div>
      </div>
      <div class="text-image second" @mouseleave="chapter = null">
        <div class="img-container">
          <img class="img" ref="second" src="@/assets/images/chap2.webp" alt="Chapter 2 Grand Budapest hotel"
            loading="lazy" width="auto" height="254" @mouseover="chapter = 2; animation(2)" />
        </div>
        <h3 :class="chapter !== 2 ? 'none' : ''">Chapitre 1.</h3>
        <p :class="chapter !== 2 ? 'none paragraph2' : 'paragraph2'">1932, Monsieur Gustave, le concierge du très
          prestigieux hôtel le Grand Budapest embauche Zéro, un jeune ayant immigré à cause de la guerre, comme
          lobby-boy.
          La guerre se prépare et madame D., cliente de longue date de l'hôtel préssent qu'elle va mourir.</p>
      </div>
      <div class="text-image third" @mouseleave="chapter = null">
        <div class="img-container img-draggable">
          <div class="images" ref="third">
            <img class="img" src="@/assets/images/chap3.webp" alt="Chapter 3 Grand Budapest hotel" loading="lazy"
              width="auto" height="443" @mouseover="chapter = 3; animation(3)" />
            <img class="img2" ref="draggable" src="@/assets/images/chap3_boy_with_apple.webp" loading="lazy"
              alt="Boy with Apple, fictional painting" width="auto" height="116" />
          </div>
        </div>
        <h3 :class="chapter !== 3 ? 'none' : ''" style="margin-top: 0.9rem;">Chapitre 2.</h3>
        <p :class="chapter !== 3 ? 'none paragraph3' : 'paragraph3'">Les frontières
          se ferment et la guerre débute.
          Mr Gustave hérite d'un tableau de madame D., <cite>Le garçon à la pomme</cite>. D'une valeur
          inestimable, Mr Gustave est contraint de le voler pour échapper à Dmitri, le fils avide de madame D.</p>
      </div>
      <div class="text-image fourth" @mouseleave="chapter = null">
        <div class="img-container">
          <img class="img" ref="fourth" src="@/assets/images/chap4.webp" loading="lazy"
            alt="Chapter 4 Grand Budapest hotel" width="auto" height="332" @mouseover="chapter = 4; animation(4)" />
        </div>
        <h3 :class="chapter !== 4 ? 'none' : ''">Chapitre 3.</h3>
        <p :class="chapter !== 4 ? 'none paragraph4' : 'paragraph4'">Dmitri accuse Gustave d'avoir empoisonné sa mère.
          Gustave est envoyé en prison et s'en sort avec l'aide de Zero et sa fiancée, Agatha, qui travaille chez
          Mendl's, la pâtisserie d'excellence de la région et qui a l'idée de cacher ciseaux et maillet dans ses
          gâteaux.</p>
      </div>
      <div class="text-image fifth" @mouseleave="chapter = null">
        <div class="img-container">
          <img class="img" ref="fifth" src="@/assets/images/chap5.webp" loading="lazy"
            alt="Chapter 5 Grand Budapest hotel" width="auto" height="332" @mouseover="chapter = 5; animation(5)" />
        </div>
        <h3 :class="chapter !== 5 ? 'none' : ''">Chapitres 4 et 5</h3>
        <p :class="chapter !== 5 ? 'none paragraph5' : 'paragraph5'">Gustave s'évade mais doit encore affronter Dmitri,
          devenu personnage important du régime fasciste nouvellement en place. Finalement, un second testament est
          découvert, au dos du tableau, à n'ouvrir et n'executer qu'en cas de mort par décès de madame D.. Il lègue
          l'entièreté de sa fortune à Gustave, ainsi que le grand Budapest Hôtel. Gustave finira tué par les soldats du
          régime peu après et l'hôtel reviendra à Zero.</p>
      </div>
    </div>
  </div>
</template>

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

<style scoped lang="scss">
::v-deep(.word) {
  overflow: hidden;
  display: inline-block;
  line-height: 140%;
}

.section {
  margin-top: 1rem;
}

h3,
p,
h2 {
  @media screen and (max-width: 600px) {
    padding: 0 0.5rem;
  }
}

.grid {
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