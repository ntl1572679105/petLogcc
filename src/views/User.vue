<template>
  <div>
    <div></div>
    <div class="container" :style="{ maxWidth: '1600px', margin: '0 auto' }">
      <!-- 头部背景及头像、名称 -->
      <div style="position: relative">
        <el-image
          :src="bannarSrc"
          :style="{
            width: '1200px',
            height: '235.83px',
            borderRadius: '5px 5px 0 0',
          }"
        />
        <div style="position: absolute; right: 30px; top: 30px">
          <!-- <el-button
            type="plain"
            style="background-color: transparent; color: white"
          >
            <span class="iconfont" style="font-size: 14px"
              >&#xe62c; 上传封面照片</span
            >
          </el-button> -->
          <label class="file-selector">
            <input
              type="file"
              style="display: none"
              accept="image/*"
              @change="changeBannar($event)"
            />
          </label>
        </div>

        <div
          class="avatar"
          style="position: absolute; left: 20px; bottom: -65px"
        >
          <img
            v-if="userInfo"
            style="width: 100%; height: 100%; border-radius: 4px"
            :src="userInfo.user_avatar"
            @error="handleAvatarError"
          />

          <div class="avatar-hover-effect">
            <label class="file-selector">
              <input
                type="file"
                style="display: none"
                accept="image/*"
                @change="changeAvatar($event)"
              />
            </label>
            <div class="iconfont change-avatar">
              &#xe62c;<br />
              修改我的头像
            </div>
          </div>
        </div>
      </div>
      <div style="margin-left: 180px; color: gray">
        <div>
          <span
            v-if="userInfo"
            style="font-weight: bold; font-size: 20px; color: black"
            >{{ userInfo.user_name }}</span
          ><span style="font-size: 12px; margin-left: 20px">居民</span
          ><span style="font-size: 12px; margin-left: 20px">Lv0</span>
        </div>
        <div style="font-size: 13px; margin-top: 20px">
          这个人很懒，什么都没有留下
        </div>
      </div>

      <el-row style="margin-top: 20px">
        <!-- 左侧导航 -->
        <el-col :span="4">
          <!-- 修改了导航栏的默认行为 -->
          <el-menu text-color="gray" active-text-color="gray">
            <el-menu-item
              :class="{ active: /\/user\/[^\/]+\/?$/.test($route.path) }"
              index="1"
              class="menu-item"
              @click="$router.push({ name: 'overview' })"
            >
              <div class="iconfont">&#xe667; 概览</div>
              <div class="iconfont">&#xe65f;</div></el-menu-item
            >
            <el-menu-item
              index="1"
              class="menu-item"
              :class="{ active: /\/user\/.*?\/publish\/?/.test($route.path) }"
              @click="$router.push({ name: 'article', query: { page: 1 } })"
            >
              <div class="iconfont">&#xe615; 发布</div>
              <div class="iconfont">&#xe65f;</div></el-menu-item
            >
            <!-- <el-menu-item
              index="1"
              class="menu-item"
              :class="{ active: /\/user\/.*?\/comment\/?/.test($route.path) }"
              @click="$router.push({ name: 'comment', query: { page: 1 } })"
            >
              <div class="iconfont">&#xe891; 评论</div>
              <div class="iconfont">&#xe65f;</div></el-menu-item
            > -->
            <el-menu-item
              index="1"
              class="menu-item"
              :class="{ active: /\/user\/.*?\/fosterate\/?/.test($route.path) }"
              @click="$router.push({ name: 'fosterate', query: { page: 1 } })"
            >
              <div class="iconfont">&#xe669; 寄养</div>
              <div class="iconfont">&#xe65f;</div></el-menu-item
            >
            <el-menu-item
              index="1"
              class="menu-item"
              :class="{ active: /\/user\/.*?\/photo\/?/.test($route.path) }"
              @click="$router.push({ name: 'photo', query: { page: 1 } })"
            >
              <div class="iconfont">&#xe663; 照相</div>
              <div class="iconfont">&#xe65f;</div></el-menu-item
            >

            <el-menu-item
              index="1"
              class="menu-item"
              :class="{
                active: /\/user\/.*?\/reservation\/?/.test($route.path),
              }"
              @click="$router.push({ name: 'reservation', query: { page: 1 } })"
            >
              <div class="iconfont">
                &#xe644; 预约
              </div>
              <div class="iconfont">&#xe65f;</div></el-menu-item
            >

            <el-menu-item
              index="1"
              class="menu-item"
              :class="{ active: /\/user\/.*?\/setting\/?/.test($route.path) }"
              @click="$router.push({ name: 'setting' })"
            >
              <div class="iconfont">&#xe6a4; 设置</div>
              <div class="iconfont">&#xe65f;</div></el-menu-item
            >
          </el-menu>
        </el-col>
        <!-- 右侧内容 -->
        <el-col :span="19" :offset="1" style="margin-top: 20px">
          <router-view v-if="userInfo" />
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script lang="ts">
import { Ref, defineComponent, onMounted, ref, toRefs, provide } from "vue";
import axios from "axios";
import { useRoute } from "vue-router";
const fileUploadServerUrl = "http://localhost:9000";

export default defineComponent({
  name: "Home",

  setup() {
    let data: Ref<{ avatarSrc: any; bannarSrc: any; userInfo: any }> = ref({
      avatarSrc: undefined,
      bannarSrc: require("@/assets/user/imgs/task_bg.jpg"),
      userInfo: undefined,
    });

    let { avatarSrc, bannarSrc, userInfo } = toRefs(data.value);
    provide("userInfo", userInfo);
    onMounted(() => {
      axios
        .get("/user/query/id", { params: { user_id: useRoute().params.id } })
        .then((res) => {
          userInfo.value = res.data.data[0];
          avatarSrc.value = userInfo.value.user_avatar;
        });
    });
    let methods = {
      changeAvatar(e: any) {
        const file = e.target.files[0];
        if (file) {
          const formData = new FormData();
          formData.append("file", file);
          axios
            .post(fileUploadServerUrl + "/upload", formData)
            .then((res) => {
              userInfo.value.user_avatar = res.data.data;
              return axios.post(
                "/user/update",
                `user_id=${userInfo.value.user_id}
&user_name=${userInfo.value.user_name}
&user_phone=${userInfo.value.user_phone}
&user_pwd=${userInfo.value.user_pwd}
&user_email=${userInfo.value.user_email}
&user_avatar=${userInfo.value.user_avatar}`
              );
            })
            .then(() => {
              // avatarSrc.value = userInfo.value.user_avatar;
            });
        }
      },
      changeBannar(e: any) {
        const file = e.target.files[0];
        if (file) bannarSrc.value = URL.createObjectURL(file);
      },
      handleAvatarError(e: any) {
        userInfo.value.user_avatar = require("@/assets/user/imgs/default-avatar.png");
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
@import "@/assets/user/icons/iconfont.css";
.menu-item {
  justify-content: space-between;
  &.active {
    color: orange !important;
  }
}

.file-selector {
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  position: absolute;
  cursor: pointer;
  opacity: 0;
}
.avatar {
  width: 140px;
  height: 140px;

  &:hover {
    .avatar-hover-effect {
      display: flex;
    }
  }
  .avatar-hover-effect {
    display: none;
    justify-content: center;
    align-items: center;
    position: absolute;

    border-radius: 4px;
    width: 94%;
    height: 94%;
    left: 3%;
    top: 3%;
    background-color: rgba(0, 0, 0, 0.2);

    .change-avatar {
      font-size: 14px;
      text-align: center;
      color: white;
    }
  }
}
</style>
