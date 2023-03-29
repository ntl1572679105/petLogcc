<template>
  <div class="content">
    <div class="main">
      <div class="shopList">
        <ul class="list">
          <li>
            <div class="area">
              <ul class="area-list">
                <li v-for="area in areasInHangzhou">
                  {{ area }}
                </li>
              </ul>
            </div>
          </li>
          <li v-for="item in shopList" :key="item.petshop_id">
            <img src="@/assets/logo.png" alt="" />
            <div class="shop-info">
              <div>
                <h2 class="shopname">xcxxx</h2>
                <span class="type">造型</span>
              </div>
              <p class="add"><b>地址:</b>{{ item.petshop_address }}</p>
              <p class="tel"><b>电话:</b>{{ item.petshop_phone }}</p>
              <p class="work-time"><b>营业时间:</b>周一至周六 8:00~17:00</p>
            </div>
          </li>
        </ul>
      </div>
      <div class="map">
        <h3>宠物店地点</h3>
        <petmap></petmap>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
import httpApi from "@/http/index.js";
import { ref } from "vue";
import petmap from "@/components/MapContainer.vue";
// 店铺列表
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
.content {
  background-color: #f7f7f7;
  border: 1px solid transparent;
  > .main {
    width: 1200px;
    margin: 0 auto;
    margin-top: 30px;
    display: flex;
    > .shopList {
      width: 60%;

      > .list {
        width: 100%;
        padding: 10px 20px;
        background-color: #fff;
        list-style: none;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        flex-wrap: nowrap;
        border-radius: 30px;
        box-shadow: 0px 0px 10px 5px rgba(166, 166, 166, 0.1);
        overflow: hidden;
      }
    }
  }
}

/* 地图初始化 */
.map {
  margin-left: 30px;
  background-color: #fff;
  width: 35%;
  padding: 10px;
  height: 500px;
  border-radius: 30px;
  > h3 {
    margin-left: 30px;
    display: inline-block;
    border-bottom: 3px solid #fccf00;
    margin-bottom: 20px;
    padding: 10px 0;
  }
}
.area {
  > .area-list {
    width: 100%;
    list-style: none;
    display: flex;

    align-items: center;
    flex-wrap: wrap;
    > li {
      margin: 10px;
      height: 20px;
      line-height: 20px;
      background-color: #fccf00;
      padding: 0 15px;
      font-size: 14px;
      border-radius: 5px;
      user-select: none;
    }
  }
}
</style>
