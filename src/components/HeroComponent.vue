<template>
  <div class="section-full section">
    <div class="section__lang">
      <span :class="lang == 'fr' ? 'section__lang-option--underline section__lang-option' : 'section__lang-option'"
        @click="lang = 'fr'">FR</span>
      <span>/</span>
      <span :class="lang == 'en' ? 'section__lang-option--underline section__lang-option' : 'section__lang-option'"
        @click="lang = 'en', console.log(lang)">EN</span>
    </div>
    <div class="section__center" ref="container" translate="no">
      <div class="section__heading">
        <div class="section__heading-top">
          <span class="section__title" ref="the">THE</span>
          <span class="section__title" ref="grand">GRAND</span>
        </div>
        <div class="section__heading-bottom">
          <span class="section__title" ref="budapest">BUDAPEST</span>
        </div>
      </div>
      <div class="section__image">
        <div class="section__image-container" ref="image">
          <div class="section__image-relative" ref="imageZoom">
            <img class="section__image-layer" src="@/assets/images/layer4bg.webp" alt="Grand Budapest Hôtel facade"
              width="2000" height="1500" />
            <img class="section__image-layer" ref="funicular" src="@/assets/images/layer1.webp"
              alt="Grand Budapest Hôtel facade" width="2000" height="1500" />
            <img class="section__image-layer" src="@/assets/images/layer3.webp" alt="Grand Budapest Hôtel facade"
              width="2000" height="1500" />
            <img class="section__image-layer" ref="pont" src="@/assets/images/test.webp" alt="pont stp" width="2000"
              height="3282" style="transform: translateY(-11.5%); opacity: 0;" />
            <img class="section__image-layer" src="@/assets/images/layer2.webp" alt="Grand Budapest Hôtel facade"
              width="2000" height="1500" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { ref, onMounted } from 'vue';
import { gsap } from "gsap";
import SplitType from 'split-type';

const lang = ref('fr');

// image animation
import { ScrollTrigger } from "gsap/ScrollTrigger";
gsap.registerPlugin(ScrollTrigger);

const image = ref(null);
const imageZoom = ref(null);
const container = ref(null);
const pont = ref(null);
const funicular = ref(null);

// const getX = (y) => {
//   if (y) {
//     let x = y * 0.38;
//     funicular.value.style.transform = `translateX(${x}px)`;
//   }
//   // obliger à ne se déplacer que avec un angle de 38 degrés
//   // 0.38 = tan(38)
// }
// const radianAngle = (38 * Math.PI) / 180;
// const neverEndingFunction = () => {
//   if (funicular.value) {
//     const y = funicular.value.getBoundingClientRect().y;
//     const x = y * Math.tan(radianAngle) / 5;

//     funicular.value.style.transform = `translateX(${x}px)`;
//   }
//   requestAnimationFrame(neverEndingFunction);
// };
// neverEndingFunction();
onMounted(() => {
  let tl = gsap.timeline();
  let imageAspect = gsap.timeline();
  // title
  const text = new SplitType([the.value, grand.value, budapest.value], { types: 'words, chars' });
  tl.fromTo(
    text.chars,
    { y: '130%' },
    {
      y: '0%',
      duration: 1.5,
      ease: 'power3.inOut',
      stagger: 0.02,
      delay: 0.2
    }
  );
  tl.from(image.value, {
    clipPath: 'polygon(0 50%, 100% 50%, 100% 50%, 0 50%)',
    rotate: 7,
    duration: 1.5,
    ease: 'power3.inOut'
  }, ('<0.2'));
  tl.from(imageZoom.value, {
    scale: 1.2,
    duration: 1.5,
    ease: 'power3.inOut',
  }, ('<'));
  let bottomValue = container.value.getBoundingClientRect().height;

  gsap.fromTo(image.value, {
    rotate: 1.3,
  }, {
    scale: 2.8,
    rotate: 0,
    y: 300,
    aspectRatio: '1440 / 1050',
    scrollTrigger: {
      trigger: budapest.value,
      start: "top center",
      end: "bottom+=200px center",
      scrub: 0.5,
      onEnterBack: () => {
        image.value.style.maskImage = 'none';
        gsap.to(pont.value, {
          opacity: 0,
          duration: 0.3,
          ease: 'power3.inOut'
        })
      },
      onLeave: () => {
        gsap.fromTo(image.value, {
          maskImage: 'linear-gradient(to bottom, rgba(0, 0, 0, 1) 100%, rgba(0, 0, 0, 0.5) 100%, rgba(0, 0, 0, 0))',
          opacity: 1,
        }, {
          maskImage: 'linear-gradient(to bottom, rgba(0, 0, 0, 1) 92%, rgba(0, 0, 0, 0.5) 97%, rgba(0, 0, 0, 0))',
          opacity: 1,
          duration: 1,
          ease: 'power3.inOut',
        });
        // neverEndingFunction();
        gsap.to(pont.value, {
          opacity: 1,
          duration: 1,
          ease: 'power3.inOut'
        })
        if (window.innerWidth / window.innerHeight < 1) {
          imageAspect.to(image.value, {
            aspectRatio: '1455 / 2500',
            scrollTrigger: {
              trigger: container.value,
              start: `${bottomValue} center`,
              end: `${bottomValue} top`,
              scrub: 0.5,
            }
          });
          imageAspect.to(funicular.value, {
            y: funicular.value.getBoundingClientRect().height,
            x: funicular.value.getBoundingClientRect().height * (-7.5 * Math.PI) / 18,
            ease: 'none',
            scrollTrigger: {
              trigger: container.value,
              start: `${bottomValue} center`,
              markers: true,
              end: `bottom+=${window.innerHeight}px end`,
              scrub: 0.8,
            }
          })
        } else {
          imageAspect.to(image.value, {
            aspectRatio: '1455 / 2500',
            scrollTrigger: {
              trigger: container.value,
              start: `${bottomValue} end`,
              end: `bottom+=${window.innerHeight}px end`,
              scrub: 0.5,
            }
          });

          // console.log(pont.value.getBoundingClientRect().bottom);
          imageAspect.to(funicular.value, {
            y: funicular.value.getBoundingClientRect().height,
            x: funicular.value.getBoundingClientRect().height * (-7.35 * Math.PI) / 18,
            ease: 'none',
            scrollTrigger: {
              trigger: container.value,
              start: `${bottomValue + 50} top`,
              end: `bottom+=${window.innerHeight}px end`,
              scrub: 0.8,
            }
          })
        }
      },
    },
    ease: 'power1.in'
  })
  // funicular.value.style.transform = `translateX(-30px)`;

})


// title text animation
const the = ref(null);
const grand = ref(null);
const budapest = ref(null);


//


</script>
<style scoped lang="scss">
.section {
  position: relative;
  overflow: hidden;
  min-height: calc(230vh);

  @media (orientation: portrait) {
    min-height: calc(130vh);
  }

  &__lang {
    position: absolute;
    right: 0;
    font-family: 'melodrama', sans-serif;
    font-size: 1.4rem;
    display: flex;
    justify-content: flex-end;
    margin: 1rem;
    z-index: 2;
    gap: 0.3rem;
  }

  &__lang-option {
    cursor: pointer;

    &--underline {
      text-decoration: underline;
      text-decoration-thickness: 1px;
      text-underline-offset: 4px;
    }
  }

  &__title {
    line-height: 100%;
    font-family: 'melodrama', sans-serif;
    text-transform: uppercase;
    overflow: hidden;
    display: inline-block;

    .letter {
      display: inline-block;
      transform: translateY(100%);
    }
  }

  &__center {
    position: relative;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  &__heading {
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: fit-content;
    transform: translateY(2.7vw);

    &-top {
      width: 100%;
      display: flex;
      justify-content: space-between;
      font-size: 15vw;
    }

    &-bottom {
      font-size: 19vw;
      line-height: 120%;
      margin-top: 7vw;
    }
  }

  &__image {
    overflow-y: hidden;

    &-container {
      user-select: none;
      overflow: hidden;
      position: absolute;
      top: 50%;
      left: 50%;
      width: 36vw;
      height: fit-content;
      transform: translate(-50%, -50%) rotate(1.3deg);
      clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
      z-index: 2;
      aspect-ratio: 574 / 345;
      //aspect-ratio: 1455 / 1107;
    }

    &-relative {
      position: relative;
      width: 100%;
      height: auto;
      object-fit: cover;
    }

    &-layer {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: auto;
      object-fit: cover;
      object-position: top;
    }
  }
}
</style>