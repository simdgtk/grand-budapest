<script setup>
import { ref, onMounted } from 'vue';

const canvas = ref(null);

onMounted(() => {
  // Initialisation des images
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

  const ctx = canvas.value.getContext("2d");
  canvas.value.width = window.innerWidth;
  canvas.value.height = window.innerHeight;

  const images = [img, img1, img2, img3, img4, img5];
  let loadedImages = 0;

  const positions = [
    1.5 * window.innerHeight / 100,
    96 * window.innerHeight / 100
  ];

  // Chargement des coins
  cornerL.onload = () => {
    let t = 0;
    positions.forEach((y) => {
      t++;
      ctx.scale(t % 2 ? 1 : -1, 1);
      console.log(t % 2 ? 1 : -1, 1);


      ctx.drawImage(
        cornerL,
        1 * window.innerWidth / 100,
        y,
        window.innerWidth > window.innerHeight ? 1 * window.innerWidth / 100 : 2 * window.innerHeight / 100,
        window.innerWidth > window.innerHeight ? 1 * window.innerWidth / 100 : 2 * window.innerHeight / 100,
      );

      ctx.scale(-1, 1);
      ctx.drawImage(
        cornerL,
        -(99 * window.innerWidth / 100),
        y,
        window.innerWidth > window.innerHeight ? 1 * window.innerWidth / 100 : 2 * window.innerHeight / 100,
        window.innerWidth > window.innerHeight ? 1 * window.innerWidth / 100 : 2 * window.innerHeight / 100,
      );
      ctx.scale(-1, 1);
    });
  };

  // Chargement des images
  images.forEach((image) => {
    let t = 0;
    image.onload = () => {
      t++;
      ctx.scale(t % 2 ? 1 : -1, 1);

      loadedImages++;
      if (loadedImages === images.length) {
        positions.forEach((y) => {
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
  </div>
</template>

<style lang="scss" scoped>
.main {
  position: relative;

  #border {
    position: absolute;
    z-index: 9999;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    overflow: hidden;
    background-color: bisque;
  }
}

.section-full {
  width: 100vw;
  height: 100vh;
  background: bisque;
}
</style>
