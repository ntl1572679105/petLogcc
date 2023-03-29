<template>
  <div class="content">
    <div class="main">
      <div class="photo">
        <h2>作品展示</h2>
        <div>
          <ul class="photoList">
            <li v-for="img in url" :key="img">
              <el-image
                style="width: 220px; height: 220px"
                :src="img"
                :zoom-rate="1.2"
                :preview-src-list="srcList"
                :initial-index="4"
                fit="cover" />
              <div class="desc"></div>
            </li>
          </ul>
        </div>
      </div>
      <div class="shop">
        <h3>照相馆</h3>
        <ul class="shopList">
          <li v-for="el in shopList" :key="el.petshop_id">
            <img :src="el.petshop_img" alt="" />
            <p class="shopname">{{ el.petshop_name }}</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import httpApi from "@/http/index.js";
const url = [
  "https://fuss10.elemecdn.com/a/3f/3302e58f9a181d2509f3dc0fa68b0jpeg.jpeg",
  "https://fuss10.elemecdn.com/1/34/19aa98b1fcb2781c4fba33d850549jpeg.jpeg",
  "https://fuss10.elemecdn.com/0/6f/e35ff375812e6b0020b6b4e8f9583jpeg.jpeg",
  "https://fuss10.elemecdn.com/9/bb/e27858e973f5d7d3904835f46abbdjpeg.jpeg",
  "https://fuss10.elemecdn.com/d/e6/c4d93a3805b3ce3f323f7974e6f78jpeg.jpeg",
  "https://fuss10.elemecdn.com/3/28/bbf893f792f03a54408b3b7a7ebf0jpeg.jpeg",
  "https://fuss10.elemecdn.com/2/11/6535bcfb26e4c79b48ddde44f4b6fjpeg.jpeg",
];
const srcList = [
  "https://fuss10.elemecdn.com/a/3f/3302e58f9a181d2509f3dc0fa68b0jpeg.jpeg",
  "https://fuss10.elemecdn.com/1/34/19aa98b1fcb2781c4fba33d850549jpeg.jpeg",
  "https://fuss10.elemecdn.com/0/6f/e35ff375812e6b0020b6b4e8f9583jpeg.jpeg",
  "https://fuss10.elemecdn.com/9/bb/e27858e973f5d7d3904835f46abbdjpeg.jpeg",
  "https://fuss10.elemecdn.com/d/e6/c4d93a3805b3ce3f323f7974e6f78jpeg.jpeg",
  "https://fuss10.elemecdn.com/3/28/bbf893f792f03a54408b3b7a7ebf0jpeg.jpeg",
  "https://fuss10.elemecdn.com/2/11/6535bcfb26e4c79b48ddde44f4b6fjpeg.jpeg",
];

interface shop {
  admin_level: string;
  petshop_address: string;
  petshop_id: number;
  petshop_name: string;
  petshop_phone: number;
  petshop_img: string;
}
const shopList: any = ref<shop>();
httpApi.petshopApi.listAllPetshop({ pno: 1, count: 3 }).then((res: any) => {
  console.log(res);
  shopList.value = res.data.data.data;
  console.log(shopList.value);
});
</script>

<style scoped lang="scss">
.content {
  background-color: #f7f7f7;
  > .main {
    width: 1200px;
    margin: 0 auto;
    display: flex;
    padding: 10px;
    > .photo {
      width: 70%;
      background-color: #fff;
      margin-top: 20px;
      > h2 {
        display: inline-block;
        border-bottom: 3px solid var(--el-color-primary);
        padding-bottom: 5px;
        margin-bottom: 10px;
      }
      .photoList {
        display: flex;
        flex-wrap: wrap;
        list-style: none;
        padding: 10px;
        justify-content: space-evenly;
        > li {
          margin: 10px;
        }
      }
    }
    > .shop {
      > h3 {
        display: inline-block;
        border-bottom: 3px soild var(--el-color-primary);
        padding-top: 5px;
        margin-bottom: 10px;
      }
      width: 25%;
      margin-left: 20px;
      background-color: #fff;
      padding: 10px;
      margin-top: 20px;
      > .shopList {
        display: flex;
        flex-direction: column;
        list-style: none;
        padding: 10px;
        > li {
          margin-bottom: 20px;
          > img {
            width: 100%;
            height: 230px;
          }
        }
      }
    }
  }
}
</style>
