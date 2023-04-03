<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect" router>
          <img src="../../public/logo.png" alt="">
          <el-menu-item index="/home/index">首页</el-menu-item>
          <el-menu-item index="/home/petshop">宠物店</el-menu-item>
          <el-menu-item index="/home/community" >社区</el-menu-item>
          <el-menu-item index="/home/news">新闻</el-menu-item>
          <el-menu-item index="/home/science">科普</el-menu-item>
          <el-button @click="$router.push('/login')">登录</el-button>
          <el-button>用户信息</el-button>
        </el-menu>
      </el-header>

      <el-main>
        <router-view/>
      </el-main>
      
      <el-footer>Footer</el-footer>
    </el-container>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router';


const activeIndex = ref('1')
const router  = useRouter()
const handleSelect = (key: string, keyPath: string[]) => {
  router.push(key)
}


</script>

<style scoped lang="scss">
*{
  margin: 0;
  padding: 0;
}
.common-layout{
  width: 100vw;
  .el-container{
    // position: relative;
    .el-menu{
      display: flex;
      align-items: center;
      justify-content: space-evenly;
    }
    .el-main{
        // position: absolute;
        width: 100vw;
        top: 60px;
        margin: -3px; 
        // background-color: saddlebrown;
    }
  }

}
</style>