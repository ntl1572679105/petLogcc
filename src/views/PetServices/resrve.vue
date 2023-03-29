<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect" router>
          <img src="../../../public/logo.png" alt="" />
          <el-menu-item index="/home/index">首页</el-menu-item>
          <el-menu-item index="/home/pet-services">宠物服务</el-menu-item>
          <el-menu-item index="/home/community">社区</el-menu-item>
          <el-menu-item index="/home/news">新闻</el-menu-item>
          <el-menu-item index="/home/science">科普</el-menu-item>
          <el-button @click="$router.push('/login')">登录</el-button>
          <el-button>用户信息</el-button>
        </el-menu>
      </el-header>
      <el-main>
        <!--  宠物店信息 -->
        <div>
          <img src="" alt="" />
          <p class="add">地址</p>
          <p class="tel">电话</p>
          <p class="work-time">工作时间</p>
        </div>
        <!-- 用户预约信息 -->
        <div class="resrve">
          <div class="resrve-info">
            <p>预约信息</p>
            <el-form label-width="80px" :inline="false" size="normal" label-position="top">
              <el-form-item label="预约类型" size="normal"> </el-form-item>

              <el-form-item label="姓名">
                <el-input v-model="user.name"></el-input>
              </el-form-item>
              <el-form-item label="宠物名称">
                <el-input v-model="user.petname"></el-input>
              </el-form-item>
              <el-form-item label="宠物类型">
                <el-radio-group v-model="type_id">
                  <el-radio :label="'猫'">猫咪</el-radio>
                  <el-radio :label="'狗'">狗狗</el-radio>
                  <el-radio :label="'其他'">其他</el-radio>
                  <el-input
                    :readonly="type_id !== '其他'"
                    v-model="user.type"
                    placeholder="请输入您的宠物是哪种类型"></el-input>
                </el-radio-group>
              </el-form-item>
              <el-form-item label="预约时间">
                <div class="block">
                  <el-date-picker
                    v-model="user.reserve"
                    type="datetime"
                    placeholder="选择日期时间"
                    style="width: 400px">
                  </el-date-picker>
                </div>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" style="margin: 0 auto">立即预约</el-button>
              </el-form-item>
            </el-form>
          </div>
          <div class="rules">
            <p>以下是预约规定：</p>
            <p>1. 预约时间不得超过可用时间范围，且预约时间段应符合工作日和工作时间段。</p>
            <p>2. 预约成功后，请在预约时间前来，并保持准时到达。若需更改预约时间，请提前更改。</p>
            <p>3. 每位预约者只能预约一个时间段。如需再次预约，请等待当前预约生效或取消后再进行。</p>
            <p>4. 如因故无法按时到达，请提前联系我们进行调整。</p>
            <p>5. 请勿私自更改、删除或发布与预约相关信息，如有需要，请直接联系我们。</p>
          </div>
        </div>
      </el-main>
      <el-footer>Footer</el-footer>
    </el-container>
  </div>
</template>

<script setup lang="ts">
import { PLACEHOLDERS_ALIAS } from "@babel/types";
import { divide } from "lodash";
import { ref } from "vue";
import { useRouter } from "vue-router";
const activeIndex = ref("1");
const router = useRouter();
const handleSelect = (key: string, keyPath: string[]) => {
  router.push(key);
};

// 用户信息
interface User {
  name: string;
  petname: string;
  type: string;
  reserve: string;
}
const type_id = ref<string>();
const user = ref<User>({
  name: "",
  petname: "",
  type: "",
  reserve: "",
});
if (type_id.value !== "其他") {
  user.value!.type = type_id.value!;
}

// 预约类型信息

</script>

<style lang="scss" scoped>
.el-menu-demo {
  width: 1200px;
  margin: 0 auto;
}
.el-menu {
  display: flex;
  align-items: center;
  justify-content: space-evenly;
}
.el-main {
  margin: 0;
  padding: 0;
}
/* 预约信息样式 */
.resrve {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  > .resrve-info {
    width: 400px;
    > p {
      width: 25%;
      margin: 20px 0;
      padding-bottom: 10px;
      font-size: 20px;
      border-bottom: 3px solid var(--el-color-primary);
    }
  }
  > .rules {
    line-height: 50px;
    color: #333;
  }
}
</style>
