<template>
  <div class="content">
    <div class="desc">
      <h2>专注宠物生活</h2>
      <small>目前暂不提供网购，所有商品在各连锁店均有销售</small>
    </div>
    <ul>
      <li v-for="item in list" :key="item.id">
        <img :src="item.commondity_img" alt="" style="height: calc((1200px - 10px * 2) / 3)" />
        <b>￥{{ item.commondity_price }}</b>
        <span>{{ item.commondity_description }}</span>
        <p>店铺名称</p>
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import httpApi from "@/http/index.js";
interface commodity {
  commondity_description: string;
  commondity_img: string;
  commondity_price: number;
  petshop_id: number;
}
const list: any = ref<commodity>();
let params = { page: 1, pagesize: 10 };

httpApi.petshopApi.getAllCommondity(params).then((res: any) => {
  console.log(res);
  list.value = res.data.data;
  console.log(list.value);
});
</script>

<style lang="scss" scoped>
.content {
  width: 1200px;
  margin: 0 auto;
  > .desc {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 20px 0;
    line-height: 30px;
  }
  ul {
    width: 1200px;
    list-style: none;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
    li {
      width: calc((1200px - 10px * 2) / 3);
      display: flex;
      flex-direction: column;
      padding: 10px;
      > b {
        padding: 10px 0;
      }
      > span {
        display: inline-block;
        white-space: nowrap;
        width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
      }
      span {
        padding-bottom: 10px;
      }
    }
  }
}
</style>
