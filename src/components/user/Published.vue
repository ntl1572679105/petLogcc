<template>
  <no-items />
</template>
<script lang="ts">
import { defineComponent } from "vue";
import NoItems from "./NoItems.vue";

export default defineComponent({
  name: "Published",
  components: { NoItems },
});
</script>
