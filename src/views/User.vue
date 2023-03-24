<template>
  <div>
    <div class="container" :style="{ maxWidth: '1600px', margin: '0 auto' }">
      <!-- 头部背景及头像、名称 -->
      <div style="position: relative">
        <el-image
          :src="require('@/assets/imgs/task_bg.jpg')"
          :style="{ width: '100%', borderRadius: '5px 5px 0 0' }"
        />
        <el-button
          type="plain"
          style="
            background-color: transparent;
            color: white;
            position: absolute;
            right: 30px;
            top: 30px;
          "
        >
          <Picture
            style="width: 16px; height: 1em; margin-right: 4px"
          ></Picture>
          上传封面照片
        </el-button>
        <div
          class="avatar"
          style="position: absolute; left: 20px; bottom: -65px"
        >
          <el-avatar
            shape="square"
            style="width: 100%; height: 100%"
            :src="require('@/assets/imgs/default-avatar.png')"
          ></el-avatar>
          <div class="avatar-hover-effect"></div>
        </div>
      </div>
      <div style="margin-left: 180px; color: gray">
        <div>
          <span style="font-weight: bold; font-size: 20px; color: black"
            >Uyg</span
          ><span style="font-size: 12px; margin-left: 20px">居民</span
          ><span style="font-size: 12px; margin-left: 20px">Lv0</span>
        </div>
        <div style="font-size: 13px; margin-top: 20px">
          这个人很懒，什么都没有留下
        </div>
      </div>

      <el-row style="margin-top: 20px">
        <!-- 侧边栏导航 -->
        <el-col :span="4">
          <el-menu>
            <el-menu-item
              index="overview"
              class="menu-item"
              @click="$router.push({ name: 'overview' })"
            >
              <div class="menu-item-left">
                <User class="menu-item-left-icon" />
                概览
              </div>
              <ArrowRight class="menu-item-arrow"
            /></el-menu-item>
            <el-menu-item
              index="published"
              class="menu-item"
              @click="$router.push({ name: 'published' })"
            >
              <div class="menu-item-left">
                <Document class="menu-item-left-icon" />
                发布的
              </div>
              <ArrowRight class="menu-item-arrow"
            /></el-menu-item>
            <el-menu-item index="order" class="menu-item">
              <div class="menu-item-left">
                <List class="menu-item-left-icon" />
                订单
              </div>
              <ArrowRight class="menu-item-arrow"
            /></el-menu-item>
            <el-menu-item
              index="code"
              class="menu-item"
              @click="$router.push({ name: 'invitationCode' })"
            >
              <div class="menu-item-left">
                <Key class="menu-item-left-icon" />
                邀请码
              </div>
              <ArrowRight class="menu-item-arrow"
            /></el-menu-item>
            <el-menu-item index="subscription" class="menu-item">
              <div class="menu-item-left">
                <Collection class="menu-item-left-icon" />
                关注
              </div>
              <ArrowRight class="menu-item-arrow"
            /></el-menu-item>
            <el-menu-item index="fans" class="menu-item">
              <div class="menu-item-left">
                <User class="menu-item-left-icon" />
                粉丝
              </div>
              <ArrowRight class="menu-item-arrow"
            /></el-menu-item>
            <el-menu-item index="favorite" class="menu-item">
              <div class="menu-item-left">
                <User class="menu-item-left-icon" />
                收藏
              </div>
              <ArrowRight class="menu-item-arrow"
            /></el-menu-item>
            <el-menu-item
              index="setting"
              class="menu-item"
              @click="$router.push({ name: 'setting' })"
            >
              <div class="menu-item-left">
                <User class="menu-item-left-icon" /> 设置
              </div>
              <ArrowRight class="menu-item-arrow"
            /></el-menu-item>
          </el-menu>
        </el-col>
        <!-- 右侧内容 -->
        <el-col :span="19" :offset="1" style="margin-top: 20px">
          <router-view />
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, toRefs } from "vue";

export default defineComponent({
  name: "Home",
  setup() {
    let data = ref({
      a: 9,
      b: 8,
    });
    let { a, b } = toRefs(data.value);
    let methods = {
      change() {
        a.value++;
      },
    };

    return {
      ...toRefs(data.value),
      ...methods,
    };
  },
  components: {},
});
</script>

<style scoped lang="scss">
.menu-item {
  justify-content: space-between;
}
.menu-item-left {
  display: flex;
  align-items: center;
}
.menu-item-left-icon {
  margin-right: 5px;
  width: 1.3rem;
  height: 1.3rem;
}
.menu-item-arrow {
  width: 1rem;
  height: 1rem;
}

.avatar {
  width: 130px;
  height: 130px;
  &:hover{
    .avatar-hover-effect {
    display: block;
  }
  }
  .avatar-hover-effect {
    display: none;
    position: absolute;
    border-radius: 4px;
    width: 94%;
    height: 94%;
    left: 3%;
    top: 3%;
    background-color: black;
    opacity: 0.2;
  }
}
</style>
