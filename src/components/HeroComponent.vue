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
          <span class="title">THE</span>
          <span class="title">GRAND</span>
        </div>
        <div class="bottom">
          <span class="title big">BUDAPEST</span>
        </div>
      </div>
      <div class="img-container">
        <div class="img-relative">
          <img src="@/assets/images/layer4bg.webp" alt="Grand Budapest Hôtel facade" width="2000" height="1500" />
          <img src="@/assets/images/layer1.webp" alt="Grand Budapest Hôtel facade" width="2000" height="1500" />
          <img src="@/assets/images/layer3.webp" alt="Grand Budapest Hôtel facade" width="2000" height="1500" />
          <img src="@/assets/images/layer2.webp" alt="Grand Budapest Hôtel facade" width="2000" height="1500" />
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { ref } from 'vue';

const lang = ref('fr');

</script>
<style scoped lang="scss">
.section-full {
  position: relative;

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

  .img-container {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 36vw;
    height: fit-content;
    transform: translate(-50%, -50%);
    z-index: 2;
    aspect-ratio: 574 / 345;

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
      aspect-ratio: 574 / 345;

    }
  }
}

.title {
  line-height: 135%;
  font-family: 'melodrama', sans-serif;
  text-transform: uppercase;
}

.h1 {
  // user-select: none;
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: fit-content;
  transform: translateY(1.2vw);

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
  }
}

.option {
  cursor: pointer;
}
</style>