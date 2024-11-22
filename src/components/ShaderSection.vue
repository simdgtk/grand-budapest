<template>
  <div class="section">
    <div class="main-grid">
      <div class="img-container">
        <img src="@/assets/images/shader.webp" alt="Shader" />
      </div>
    </div>
  </div>
</template>
<script setup>
</script>
<style scoped lang="scss">
.section {
  margin: 25rem 0;
}

.main-grid {
  .img-container {
    grid-column: 2 / -2;
    // grid-column-start: 1;

    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  }
}
</style>
