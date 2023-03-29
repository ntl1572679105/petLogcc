<template>
  <!-- 标题 -->
  <div class="content">
    <div class="desc">
      <h4>是否一直烦劳宠物洗澡问题？是否担心宠物身上带有危险细菌？</h4>
      <h4>请选择我们，由我们来为您的宠物提供专业的洗澡和造型服务!</h4>
    </div>
    <!-- 轮播图展示 -->
    <div class="carousel">
      <el-carousel :interval="4000" type="card" height="300px">
        <el-carousel-item v-for="item in carousel" :key="item">
          <img :src="item" alt="" />
        </el-carousel-item>
      </el-carousel>
    </div>
    <div class="main">
      <!-- 宠物店选择 -->

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
        <li v-for="item in shopList" :key="item.petshop_id" @click="$router.push(`/resrve?pid=${item.petshop_id}`)">
          <img src="@/assets/logo.png" alt="" />
          <div class="shop-info">
            <div>
              <h2 class="shopname">xcxxx</h2>
              <span class="type">造型</span>
            </div>
            <p class="add"><b>地址:</b>{{ item.petshop_address }}</p>
            <p class="tel"><b>电话:</b>{{ item.petshop_phone }}</p>
            <p class="work-time"><b>营业时间:</b>周一至周六 8:00~17:00</p>
            <p class="introduce">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum, nostrum rem! Eligendi quidem molestias
              molestiae sed explicabo, vitae deleniti corrupti obcaecati culpa debitis beatae ea earum id repellendus
              maxime quia!
            </p>
          </div>
        </li>
      </ul>
      <!-- 新闻广告 -->
      <div class="news">
        <div>
          <h3>最新消息</h3>
          <ul>
            <li v-for="t in 5">xxxxxxxxxxxxxxxxxxxxxxx</li>
          </ul>
        </div>
        <div>
          <h3>科普内容</h3>
          <ul>
            <li v-for="t in 5">xxxxxxxxxxxxxxxxxxxxxxx</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
import { ref, reactive } from "vue";
import httpApi from "@/http/index.js";

// 查询所有店铺信息
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
// 轮播图
const carousel = [
  "https://i.postimg.cc/VLZ1QQpY/screenshot-3.png",
  "https://i.postimg.cc/j58Ksp2Q/screenshot-5.png",
  "https://i.postimg.cc/sfNmWTZn/screenshot-5.png",
  "https://i.postimg.cc/nhtWWnGj/screenshot-5.png",
  "https://i.postimg.cc/tJvX5Yxx/screenshot-5.png",
  "https://i.postimg.cc/LsFZfbRM/screenshot-5.png",
];
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
  > .desc {
    display: flex;
    flex-direction: column;
    align-items: center;
    line-height: 40px;
    color: var(--el-color-primary);
  }
  > .main {
    width: 1200px;
    margin: 0 auto;
    margin-top: 20px;
    display: flex;
    justify-content: space-between;

    > .list {
      padding: 10px 20px;
      width: 60%;
      background-color: #fff;
      list-style: none;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      flex-wrap: nowrap;
      border-radius: 30px;
      overflow: hidden;
      box-shadow: 0px 0px 10px 5px rgba(166, 166, 166, 0.1);
      > li {
        cursor: pointer;
        margin-top: 20px;
        margin-bottom: 20px;
        border-bottom: 1px solid #ccc;
        width: 100%;
        display: flex;
        align-items: flex-start;
        line-height: 30px;
        > img {
          height: 180px;
          object-fit: cover;
          margin-right: 20px;
        }
        > .shop-info {
          > div {
            display: flex;
            align-items: center;
            > .shopname {
              font-size: 18px;
              margin-right: 20px;
            }
            > .type {
              height: 20px;
              background-color: orange;
              border-radius: 7px;
              padding: 0 15px;
              color: #fff;
              font-size: 14px;
              line-height: 20px;
            }
          }
          > p {
            color: #a2a2b6;
            > b {
              color: #ef8200;
            }
          }
          > .introduce {
            text-overflow: -o-ellipsis-lastline;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            line-clamp: 2;
            -webkit-box-orient: vertical;
          }
        }
      }
    }
    > .news {
      background-color: #fff;
      border-radius: 30px;
      padding: 10px 20px;
      box-shadow: 0px 0px 10px 5px rgba(166, 166, 166, 0.1);

      width: 35%;
      > div {
        margin-top: 20px;
        > h3 {
          display: inline-block;
          border-bottom: 3px solid var(--el-color-primary);
          padding-bottom: 10px;
        }
        > ul {
          list-style: none;
          > li {
            padding: 10px 0;
            border-bottom: 1px dashed #ccc;
          }
        }
      }
    }
  }
}
// 轮播图样式
// .el-carousel__item h3 {
//   color: #475669;
//   opacity: 0.75;
//   line-height: 200px;
//   margin: 0;
//   text-align: center;
// }

// .el-carousel__item:nth-child(2n) {
//   background-color: #99a9bf;
// }

// .el-carousel__item:nth-child(2n + 1) {
//   background-color: #d3dce6;
// }
.carousel {
  width: 1200px;
  margin: 0 auto;
  img {
    width: 100%;
    height: 100%;
    object-fit: contain;
  }
}
//搜索样式
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
