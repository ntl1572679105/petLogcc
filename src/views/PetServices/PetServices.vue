<template>
  <div class="content">
    <div class="title">
      <div class="mask"></div>
      <div class="text">宠物志</div>
      <div class="text">为宠物创造无限美好</div>
    </div>
    <ul class="service-nav">
      <li v-for="item in services" :key="item.id" @click="$router.push(item.to)">
        <img :src="item.src" alt="" />
        {{ item.name }}
      </li>
    </ul>
    <RouterView></RouterView>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
const services = [
  {
    id: 1,
    to: "/home/pet-services/shower",
    name: "洗澡美容",
    src: "https://i.postimg.cc/WzPB2P4J/DM-20230324110943-002.png",
  },
  {
    id: 2,
    to: "/home/pet-services/buy",
    name: "商品展示",
    src: "https://i.postimg.cc/VkcTWTYY/DM-20230324110943-006.png",
  },
  {
    id: 3,
    to: "/home/pet-services/foster-care",
    name: "爱宠寄养",
    src: "https://i.postimg.cc/SxwD0fRn/DM-20230324110943-004.png",
  },
  {
    id: 4,
    to: "/home/pet-services/photo",
    name: "爱宠合影",
    src: "https://i.postimg.cc/9QTy95Xf/DM-20230324110943-005.png",
  },
];
</script>

<style lang="scss" scoped>
.title {
  position: relative;
  min-height: 800px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: left;
  background-image: url("https://i.postimg.cc/D0VfVDsS/DM-20230324103612-001.jpg");
  background-size: cover;
  > .text {
    margin-left: 300px;
    font-size: 48px;
    color: #fff;
    position: relative;
    z-index: 999;
  }
  > .mask {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: #000;
    opacity: 0.5;
  }
}
.service-nav {
  background-color: #00ad96;
  list-style: none;
  display: flex;
  align-content: center;
  justify-content: space-evenly;
  font-size: 18px;
  border-radius: 5px;
  color: #fff;
  li {
    flex: 1;
    height: 150px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin: 5px 0;
    transition: 0.3s;
    border-radius: 15px;
    padding: 0 10px;
    &:hover {
      background-color: #61ce70;
    }
    > img {
      margin-bottom: 10px;
      width: 75px;
    }
  }
}
</style>
