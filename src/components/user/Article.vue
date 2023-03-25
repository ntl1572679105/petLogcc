<template>
  <el-row>
    <el-col :span="8">
      <div>您真的了解宠物吗</div>
      <div style="color: #607d8b; font-size: 12px; margin-top: 10px">
        宠物新鲜事
      </div>
      <div style="margin-top: 20px; font-size: 12px">10小时前</div>
    </el-col>

  </el-row>
</template>
<script lang="ts">
import { defineComponent } from "vue";
import NoItems from "./NoItems.vue";

export default defineComponent({
  name: "Article",
  components: { NoItems },
});
</script>
<style lang="scss"></style>
