<template>
  <span class="head-btn active">文章</span>
  <span class="head-btn">评论</span>
</template>
<script lang="ts">
import { defineComponent } from "vue";
import NoItems from "./NoItems.vue";

export default defineComponent({
  name: "Published",
  components: { NoItems },
});
</script>
<style lang="scss">
.head-btn{
    color:gray;
    padding:4px 8px;
    cursor: pointer;
    border-radius: 5px;
    margin-right: 20px;
    &.active{
        background-color: orange;
        color: white;
    }
}
</style>
