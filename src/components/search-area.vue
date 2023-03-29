<template>
  <div class="container">
    <div class="area">
      <ul class="area-list">
        <li v-for="area in areasInHangzhou">
          {{ area }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from "vue";

// 城市搜索
const areasInHangzhou = [
  "上城区",
  "下城区",
  "江干区",
  "拱墅区",
  "西湖区",
  "滨江区",
  "萧山区",
  "余杭区",
  "富阳区",
  "临安区",
];
</script>

<style lang="scss" scoped>
.area {
  > .area-list {
    width: 100%;
    list-style: none;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    > li {
      height: 20px;
      line-height: 20px;
      background-color: #fccf00;
      padding: 0 10px;
      font-size: 14px;
      border-radius: 5px;
    }
  }
}
</style>
