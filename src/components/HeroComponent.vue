<template>
  <div class="section-full">
    <div class="lang">
      <span :class="lang == 'fr' ? 'underline option' : 'option'" @click="lang = 'fr'">FR</span>
      <span>/</span>
      <span :class="lang == 'en' ? 'underline option' : 'option'" @click="lang = 'en', console.log(lang)">EN</span>
    </div>
    <div class="center">
      <div class="h1">
        <div class="top">
          <span class="title" ref="the">THE</span>
          <span class="title" ref="grand">GRAND</span>
        </div>
        <div class="bottom">
          <span class="title big" ref="budapest">BUDAPEST</span>
        </div>
      </div>
      <div class="img">
        <div class="img-container" ref="image">
          <div class="img-relative" ref="imageZoom">
            <img src="@/assets/images/layer4bg.webp" alt="Grand Budapest Hôtel facade" width="2000" height="1500" />
            <img src="@/assets/images/layer1.webp" alt="Grand Budapest Hôtel facade" width="2000" height="1500" />
            <img src="@/assets/images/layer3.webp" alt="Grand Budapest Hôtel facade" width="2000" height="1500" />
            <img src="@/assets/images/layer2.webp" alt="Grand Budapest Hôtel facade" width="2000" height="1500" />
            <img src="@/assets/images/test.webp" alt="pont stp" width="2000" height="3282"
              style="transform: translateY(-11%);" />
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
onMounted(() => {
  gsap.from(image.value, {
    clipPath: 'polygon(0 50%, 100% 50%, 100% 50%, 0 50%)',
    rotate: 8,
    duration: 1.5,
    delay: 0.2,
    ease: 'power3.inOut'
  });
  gsap.from(imageZoom.value, {
    scale: 1.2,
    duration: 1.5,
    delay: 0.2,
    ease: 'power3.inOut'
  });
  gsap.fromTo(image.value, {
  }, {
    scale: 2.8,
    rotate: 0,
    y: 300,
    aspectRatio: '1455 / 1107',
    scrollTrigger: {
      trigger: budapest.value,
      start: "top center",
      end: "bottom+=200px center",
      scrub: 0.5,
      markers: true
    },
    ease: 'power1.in'
  }).to(image.value, {
    aspectRatio: '1455 / 2500',
    duration: 1,
  });
})


// title text animation
const the = ref(null);
const grand = ref(null);
const budapest = ref(null);

onMounted(() => {
  const text = new SplitType([the.value, grand.value, budapest.value], { types: 'words, chars' });
  gsap.fromTo(
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
})

//


</script>
<style scoped lang="scss">
.section-full {
  position: relative;
  overflow-x: hidden;
  min-height: calc(200vh + 300px);

  .lang {
    position: absolute;
    right: 0;
    font-family: 'melodrama', sans-serif;
    font-size: 1.4rem;
    display: flex;
    justify-content: flex-end;
    margin: 1rem;
    z-index: 2;
    gap: 0.3rem;

    span {
      &.option {
        cursor: pointer;

        &.underline {
          text-decoration: underline;
          text-decoration-thickness: 1px;
          text-underline-offset: 4px;
        }
      }
    }
  }
}

.center {
  position: relative;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;

  // &::after {
  //   content: 'yes';
  //   z-index: 999;
  //   position: absolute;
  //   bottom: -650px;
  //   left: 0;
  //   transform: translateY(70%);
  //   width: 100%;
  //   height: 100%;
  //   background: url("@/assets/images/pont.svg");
  //   background-position: center;
  //   background-size: cover;
  // }
  .img {
    overflow-y: hidden;

    .img-container {
      user-select: none;
      overflow: hidden;
      position: absolute;
      top: 50%;
      left: 50%;
      width: 36vw;
      height: fit-content;
      transform: translate(-50%, -50%) rotate(2deg);
      clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
      z-index: 2;
      aspect-ratio: 574 / 345;
      //aspect-ratio: 1455 / 1107;

      .img-relative {
        position: relative;
        width: 100%;
        height: auto;
        object-fit: cover;
      }

      img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: auto;
        object-fit: cover;
        object-position: top;
        // aspect-ratio: 574 / 345;

      }
    }
  }
}

.title {
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

.h1 {
  // user-select: none;
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: fit-content;
  transform: translateY(2.7vw);

  .top {
    width: 100%;
    display: flex;
    justify-content: space-between;
    // font-size: 13.688rem;
    font-size: 15vw;
  }

  .bottom {
    // font-size: 16.563rem;
    font-size: 19vw;
    line-height: 120%;
    margin-top: 7vw;
  }
}

.option {
  cursor: pointer;
}
</style>