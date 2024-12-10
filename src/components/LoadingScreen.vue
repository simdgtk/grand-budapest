<script setup>
import { ref, onMounted } from 'vue';

const canvas = ref(null);

onMounted(() => {

})

const positionsTB = [
  1.5 * window.innerHeight / 100,
  96 * window.innerHeight / 100
];
const positionsLR = [
  window.innerWidth * 1 / 100,
  window.innerWidth * 98 / 100
];

onMounted(() => {
  //Initialisation des images
  const img = new Image();
  img.src = new URL(`@/assets/images/square0.png`, import.meta.url).href;

  const img1 = new Image();
  img1.src = new URL(`@/assets/images/square1.png`, import.meta.url).href;

  const img2 = new Image();
  img2.src = new URL(`@/assets/images/square2.png`, import.meta.url).href;

  const img3 = new Image();
  img3.src = new URL(`@/assets/images/square3.png`, import.meta.url).href;

  const img4 = new Image();
  img4.src = new URL(`@/assets/images/square4.png`, import.meta.url).href;

  const img5 = new Image();
  img5.src = new URL(`@/assets/images/square5.png`, import.meta.url).href;

  const cornerL = new Image();
  cornerL.src = new URL(`@/assets/images/corner.png`, import.meta.url).href;

  const cornerVertical = new Image();
  cornerVertical.src = new URL(`@/assets/images/cornerVertical.png`, import.meta.url).href;

  const ctx = canvas.value.getContext("2d");
  canvas.value.width = window.innerWidth;
  canvas.value.height = window.innerHeight;

  const images = [img, img1, img2, img3, img4, img5];
  let loadedImages = 0;

  //Chargement des coins
  cornerL.onload = () => {
    const cornerWidth = window.innerWidth > window.innerHeight ? 1 * window.innerWidth / 100 : 2 * window.innerHeight / 100;
    const cornerHeight = cornerWidth;

    positionsTB.forEach((y, index) => {
      if (index === 0) {
        //Première position Y : Coins gauche et droit restent inchangés
        ctx.drawImage(cornerL, 1 * window.innerWidth / 100, y, cornerWidth, cornerHeight);
        ctx.save();
        ctx.scale(-1, 1);  //Inversion horizontale pour le coin droit
        ctx.translate(cornerWidth + window.innerWidth / 100 * 0.6, 0);
        ctx.drawImage(
          cornerL,
          -99 * window.innerWidth / 100 - cornerWidth,
          y,
          cornerWidth,
          cornerHeight
        );

        ctx.restore();
      } else {
        //Autres positionsTB Y : Coins gauche et droit transformés
        ctx.save();
        ctx.translate(1 * window.innerWidth / 100 + cornerWidth / 2, y + cornerHeight / 2);
        ctx.rotate(Math.PI);  //Rotation de 180° (point vers le bas)
        ctx.scale(-1, 1);
        ctx.drawImage(cornerL, -cornerWidth / 2, -cornerHeight / 2, cornerWidth, cornerHeight);
        ctx.restore();

        //Coin droit - Rotation pour qu'il pointe vers le bas
        ctx.save();
        ctx.translate(99 * window.innerWidth / 100 - cornerWidth / 2, y + cornerHeight / 2);
        ctx.scale(1, 1);  //Inversion horizontale pour le coin droit
        ctx.rotate(Math.PI);  //Rotation de 180° (point vers le bas)
        ctx.drawImage(cornerL, -cornerWidth / 2, -cornerHeight / 2, cornerWidth, cornerHeight);
        ctx.restore();
      }
    });
  };

  //Chargement des images
  images.forEach((image) => {
    image.onload = () => {
      loadedImages++;
      if (loadedImages === images.length) {
        positionsTB.forEach((y) => {
          for (
            let j = window.innerWidth > window.innerHeight ? 2 * window.innerWidth / 100 : 3 * window.innerWidth / 100;
            window.innerWidth > window.innerHeight ? j < window.innerWidth - 3 * window.innerWidth / 100 + 1 : j < window.innerWidth - 5 * window.innerWidth / 100;
            window.innerWidth > window.innerHeight ? j += 1 * window.innerWidth / 100 : j += 2 * window.innerWidth / 100
          ) {
            ctx.drawImage(
              images[Math.round(Math.random() * 4)],
              j,
              y,
              window.innerWidth > window.innerHeight ? 1 * window.innerWidth / 100 : 2 * window.innerHeight / 100,
              window.innerWidth > window.innerHeight ? 1 * window.innerWidth / 100 : 2 * window.innerHeight / 100,

            );
          }
        });
        positionsLR.forEach((x) => {
          for (
            let j = window.innerWidth > window.innerHeight ? 2 * window.innerWidth / 100 : 3 * window.innerWidth / 100;
            window.innerWidth > window.innerHeight ? j < window.innerHeight - 3 * window.innerHeight / 100 + 1 : j < window.innerHeight - 5 * window.innerHeight / 100;
            window.innerWidth > window.innerHeight ? j += 1 * window.innerWidth / 100 : j += 2 * window.innerHeight / 100
          ) {
            const size = window.innerWidth > window.innerHeight ? 1 * window.innerWidth / 100 : 2 * window.innerHeight / 100;

            ctx.save();
            ctx.translate(x + size / 2, j + size / 2);
            ctx.rotate(Math.PI / 2); // Rotation de 90 degrés
            ctx.drawImage(
              images[Math.round(Math.random() * 4)],
              -size / 2,
              -size / 2,
              size,
              size
            );
            ctx.restore();
          }
        });


      }
    };
    image.onerror = (err) => {
      console.error("Erreur de chargement de l'image :", err);
    };
  });
});
</script>



<template>
  <div class="main">
    <div class="section-full"></div>
    <canvas id="border" ref="canvas"></canvas>
    <img class="loading__corner" src="@/assets/images/coin.png" alt="" width="210" height="210">
    <img class="loading__corner" src="@/assets/images/coin.png" alt="" width="210" height="210">
    <img class="loading__corner" src="@/assets/images/coin.png" alt="" width="210" height="210">
    <img class="loading__corner" src="@/assets/images/coin.png" alt="" width="210" height="210">
  </div>
</template>

<style lang="scss" scoped>
.main {
  position: relative;
  overflow: hidden;

  #border {
    position: absolute;
    z-index: 99;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    overflow: hidden;
    background: hsl(1, 90%, 95%);
  }

  .section-full {
    width: 100vh;
    height: 100vh;
    overflow: hidden;
    // background: #fbe9e7;
  }

  .loading__corner {
    position: absolute;
    z-index: 9999;
    aspect-ratio: 1;
    width: 15.79vw;
    height: 15.79vw;

    @media (orientation: portrait) {
      width: calc(15.79vh * 2);
      height: calc(15.79vh * 2);
    }

    user-select: none;
    pointer-events: none;

    &:nth-of-type(1) {
      top: 1.5vh;
      left: 1vw;
      transform: translateY(-6.7%) translateX(-6.7%) scale(1, -1);
    }

    &:nth-of-type(2) {
      left: 1vw;
      bottom: 4vh;
      transform: translateY(12.8%) translateX(-6.7%) scale(1, 1);
    }

    &:nth-of-type(3) {
      top: 1.5vh;
      right: 2vw;
      transform: translateY(-6.7%) translateX(13.2%) scale(-1);
    }

    &:nth-of-type(4) {
      bottom: 4vh;
      right: 2vw;
      transform: translateY(13.3%) translateX(13.2%) scale(-1, 1);
    }
  }
}
</style>
