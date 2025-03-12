<script setup>
import { ref, onMounted } from 'vue';

const footer = ref(null);

onMounted(() => {
  let hatIndex = 0;
  let timeout;
  const allHats = document.getElementsByClassName("footer__image--hat");
  const allMendls = document.getElementsByClassName("footer__image--mendls");


  window.addEventListener('wheel', () => {
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      hatIndex = (hatIndex + 1) % allHats.length;
      allHats[hatIndex].classList.add("visible")
      allMendls[hatIndex].classList.add("visible")
      allHats[hatIndex === 0 ? allHats.length - 1 : hatIndex - 1].classList.remove("visible")
      allMendls[hatIndex === 0 ? allHats.length - 1 : hatIndex - 1].classList.remove("visible")

    }, 10);
  });
});

</script>



<template>
  <div class="section">
    <div class="footer" ref="footer">
      <div class="footer__grid">
        <div class="footer__image-container">
          <img src="@/assets/images/hat/lobbyhat0.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--hat visible">
          <img src="@/assets/images/hat/lobbyhat1.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--hat">
          <img src="@/assets/images/hat/lobbyhat2.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--hat">
          <img src="@/assets/images/hat/lobbyhat3.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--hat">
          <img src="@/assets/images/hat/lobbyhat4.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--hat">
          <img src="@/assets/images/hat/lobbyhat5.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--hat">
          <img src="@/assets/images/hat/lobbyhat6.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--hat">
          <img src="@/assets/images/hat/lobbyhat7.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--hat">
          <img src="@/assets/images/hat/lobbyhat8.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--hat">
          <img src="@/assets/images/hat/lobbyhat9.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--hat">
        </div>
        <div class="footer__text">
          <div class="footer__paragraph">
            <h3>Pourquoi ce site ?</h3>
            <p>C'était surtout un prétexte, je voulais faire un site pour m'entraîner aux animations GSAP et autres
              effets JS, avec de belles ressources.<cite>The Grand Budapest Hotel</cite>,
              c'est aussi un film que j'aime beaucoup, pour son histoire, ses acteurs, et son esthétique. Vous pouvez
              retrouver mon portfolio sur <a href="https://simondaguetkargl.fr/" target="_blank"
                rel="noopener">simondaguetkargl.fr</a>. N'hésitez pas à me faire des retours sur le site, vous pouvez
              trouver
              <a href="https://github.com/simdgtk/grand-budapest/" target="_blank" rel="noopener">le code sur
                github</a>.
            </p>
          </div>
          <div class="footer__paragraph">
            <h3>Crédits</h3>
            <p>Ce site s'inspire de l'univers visuel du film <cite>The Grand Budapest Hotel</cite>, réalisé par Wes
              Anderson.
              Les images sont soit tirées du film soit des éléments 3D / 2D que j'ai reproduits pour rendre hommage à
              son esthétique et servir les besoins du site. Les crédits artistiques vont donc
              aux équipes du film, et particulièrement à <a href="https://www.annieatkins.com/" target="_blank"
                rel="noopener">Annie
                Atkins</a>, graphiste principale.</p>
          </div>
        </div>
        <div class="footer__image-container">
          <img src="@/assets/images/cap/mendls0.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--mendls visible">
          <img src="@/assets/images/cap/mendls1.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--mendls">
          <img src="@/assets/images/cap/mendls2.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--mendls">
          <img src="@/assets/images/cap/mendls3.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--mendls">
          <img src="@/assets/images/cap/mendls4.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--mendls">
          <img src="@/assets/images/cap/mendls5.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--mendls">
          <img src="@/assets/images/cap/mendls6.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--mendls">
          <img src="@/assets/images/cap/mendls7.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--mendls">
          <img src="@/assets/images/cap/mendls8.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--mendls">
          <img src="@/assets/images/cap/mendls9.webp" alt="Lobbyboy hat" width="auto" height="auto"
            class="footer__image footer__image--mendls">
        </div>
      </div>
      <div class="footer__background-logo">
      </div>
    </div>
    <span class="footer__bottom-text" translate="no">Grand Budapest Hôtel, Zubrówka - 51° 9&apos; 10&apos;&apos;
      N, 14° 59&apos; 15,&apos;&apos; O</span>
  </div>
</template>

<style scoped lang="scss">
::v-deep(.word) {
  line-height: 140%;
  clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
  display: inline-block;
}

.footer {
  position: relative;
  padding: 5rem 0;
  margin: 12rem 0;
  margin-bottom: 5rem;

  &__text {
    display: flex;
    flex-direction: column;
    gap: 3.5rem;
    grid-column: span;
  }

  &__grid {
    display: grid;
    align-items: center;
    max-width: 95%;
    margin: 0 auto;
    gap: 2rem;
    grid-template-columns: 1fr 2fr 1fr;
  }

  &__image-container {
    width: 100%;
    display: flex;
    align-items: center;
    position: relative;

  }

  &__image {
    width: 80%;
    margin: 0 auto;
    height: auto;
    position: absolute;
    display: none;

    &.visible {
      display: block;
    }

    &--mendls {
      transform: scale(1.25);
    }

    &--hat {
      transform: scale(0.75);
    }
  }

  &__background-logo {
    position: absolute;
    opacity: 0.5;
    z-index: -1;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url("@/assets/images/logo.svg");
    background-size: contain;
    background-repeat: space repeat;
    background-position: center;
    mask:
      linear-gradient(to right, transparent 5%, #fff 7% 90%, transparent 95%),
      linear-gradient(to left, transparent 5%, #fff 7% 90%, transparent 95%);
    mask-size: 110% 110%;
    mask-position: center;
    mask-repeat: no-repeat;
    mask-composite: intersect;
  }

  &__bottom-text {
    display: inline-block;
    font-style: italic;
    color: $color-secondary;
    width: 100%;
    text-align: center;
    margin-bottom: 1rem;
  }
}
</style>