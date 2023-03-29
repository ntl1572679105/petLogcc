<template>
  <div v-if="userInfo">
    <h3 style="color: gray; margin-top: 0">基本资料</h3>
    <!-- 昵称 -->
    <el-row class="table-row">
      <el-col class="label" :span="6"> 昵称</el-col>
      <el-col v-if="!nicknameEditting" class="content" :span="18">
        <span class="text">{{ userInfo.user_name }}</span>
        <span class="hover-edit iconfont" @click="nicknameEditting = true"
          >&#xe600; 编辑</span
        ></el-col
      >
      <el-col v-else class="content" :span="18">
        <el-input style="width: 200px" v-model="tempUserInfo.user_name" />
        <div class="hint-text" style="margin-top: 10px">中文、英文或数字</div>
        <div style="margin-top: 10px">
          <el-button plain type="warning" @click="nicknameEditting = false"
            >取消</el-button
          >
          <el-button type="warning" @click="nicknameSave()">保存</el-button>
        </div>
      </el-col>
    </el-row>
    <!-- 性别 -->
    <el-row class="table-row">
      <el-col class="label" :span="6">性别</el-col>
      <el-col v-if="!genderEditting" class="content" :span="18">
        <span class="text">{{ userInfo.user_sex === 1 ? "男" : "女" }}</span>

        <!-- <span class="hover-edit iconfont" @click="genderEditting = true"
          >&#xe600; 编辑</span
        > -->
      </el-col>

      <!-- <el-col v-else class="content" :span="18">
        <el-radio-group v-model="tempUserInfo.user_sex">
          <el-radio :label="1" size="large">男</el-radio>
          <el-radio :label="0" size="large">女</el-radio>
        </el-radio-group>
        <div class="hint-text" style="margin-top: 10px">中文、英文或数字</div>
        <div style="margin-top: 10px">
          <el-button plain type="warning" @click="genderEditting = false"
            >取消</el-button
          >
          <el-button type="warning" @click="genderSave()">保存</el-button>
        </div>
      </el-col> -->
    </el-row>

    <el-row class="table-row">
      <el-col class="label" :span="6">邮箱</el-col>
      <el-col v-if="!emailEditting" class="content" :span="18">
        <span class="text">{{ userInfo.user_email }}</span>
        <span class="hover-edit iconfont" @click="emailEditting = true"
          >&#xe600; 编辑</span
        ></el-col
      >
      <el-col v-else class="content" :span="18">
        <el-input style="width: 200px" v-model="tempUserInfo.user_email" />
        <div class="hint-text" style="margin-top: 10px">输入邮箱</div>

        <div style="margin-top: 10px">
          <el-button plain type="warning" @click="emailEditting = false"
            >取消</el-button
          >
          <el-button type="warning" @click="emailSave()">保存</el-button>
        </div>
      </el-col>
    </el-row>
    <!-- <el-row class="table-row">
      <el-col class="label" :span="6">一句话介绍自己 </el-col>
      <el-col v-if="!introduceEditting" class="content" :span="18"
        ><span class="text">这个人很懒，什么都没留下</span
        ><span class="hover-edit iconfont" @click="introduceEditting = true"
          >&#xe600; 编辑</span
        ></el-col
      >
      <el-col v-else class="content" :span="18">
        <el-input style="width: 200px" />

        <div style="margin-top: 10px">
          <el-button plain type="warning" @click="introduceEditting = false"
            >取消</el-button
          >
          <el-button type="warning">保存</el-button>
        </div>
      </el-col>
    </el-row> -->
    <!-- <el-row class="table-row">
      <el-col class="label" :span="6">收货地址</el-col>
      <el-col class="content" :span="18">
        <div>
          <el-button
            v-if="!addressEditting"
            plain
            type="warning"
            @click="addressEditting = true"
            >+ 添加收货地址</el-button
          >
          <div v-else>
            <el-input placeholder="地址" />
            <el-input placeholder="姓名" style="margin-top: 15px" />
            <el-input placeholder="电话" style="margin-top: 15px" />

            <div style="margin-top: 10px">
              <el-button plain type="warning" @click="addressEditting = false"
                >取消</el-button
              >
              <el-button type="warning">添加</el-button>
            </div>
          </div>
          <div class="hint-text" style="margin-top: 10px">
            如果您在本站购物，请务必填写此项，以便发货
          </div>
        </div>
      </el-col>
    </el-row> -->
    <!-- 手机号码 -->
    <el-row class="table-row">
      <el-col class="label" :span="6">绑定手机</el-col>
      <el-col class="content" :span="18">
        <div v-if="!phoneEditting">
          <span class="text">{{ userInfo.user_phone }}</span
          ><span class="hover-edit iconfont" @click="phoneEditting = true"
            >&#xe600; 编辑</span
          >
        </div>
        <div v-else>
          <el-input style="width: 200px" v-model="tempUserInfo.user_phone" />

          <div style="margin-top: 10px">
            <el-button plain type="warning" @click="phoneEditting = false"
              >取消</el-button
            >
            <el-button type="warning" @click="phoneSave()">保存</el-button>
          </div>
        </div>
        <div class="hint-text" style="margin-top: 10px">手机号码可用作登录</div>
      </el-col>
    </el-row>
    <el-row class="table-row">
      <el-col class="label" :span="6">修改密码</el-col>
      <el-col class="content" :span="18">
        <div
          v-if="!passwordEditting"
          style="color: orange; cursor: pointer"
          @click="passwordEditting = true"
        >
          修改
        </div>
        <div v-else>
          <div>
            <el-input
              style="width: 200px"
              placeholder="新密码"
              type="password"
              v-model="newPassword"
            />
          </div>
          <div style="margin-top: 15px">
            <el-input
              style="width: 200px"
              placeholder="重复新密码"
              type="password"
              v-model="newRepeatPassword"
            />
          </div>

          <div style="margin-top: 10px">
            <el-button plain type="warning" @click="passwordEditting = false"
              >取消</el-button
            >
            <el-button type="warning" @click="passwordSave()">保存</el-button>
          </div>
          <div class="hint-text" style="margin-top: 10px">
            密码长度至少6位，且必须包含数字、大小写字母及特殊字符
          </div>
        </div>
      </el-col>
    </el-row>
    <!-- <el-row style="margin-top: 30px">头像选择</el-row>
    <el-row style="margin-top: 30px"
      ><img
        style="width: 100px"
        src="@/assets/user/imgs/default-avatar.png"
        alt=""
    /></el-row> -->
    <!-- <el-row style="margin-top: 30px">社交绑定</el-row>
    <el-row style="margin-top: 30px">
      <el-col :offset="2" :span="22">
        <div>QQ</div>
        <div>未绑定</div>
        <el-button type="warning">添加绑定</el-button>
      </el-col>
    </el-row> -->
    <!-- <el-row style="margin-top: 30px">上传收款码</el-row>
    <el-row style="margin-top: 30px">
      <div class="QR-code">
        <span class="hover-text">微信</span>
        <img :src="microMsgQRCode" />
        <input
          type="file"
          class="file-selector"
          accept="image/*"
          @change="changeMicroMsgQRCode($event)"
        />
      </div>
      <div class="QR-code" style="margin-left: 30px">
        <span class="hover-text">支付宝</span>
        <img :src="alipayQRCode" />
        <input
          type="file"
          class="file-selector"
          accept="image/*"
          @change="changeAlipayQRCode($event)"
        />
      </div>
    </el-row>
    <el-row class="hint-text" style="margin-top: 30px">
      如果您需要提现，我们会通过此二维码进行转账
    </el-row> -->
  </div>
</template>
<script lang="ts">
import { defineComponent, inject, ref, toRefs, Ref, watch } from "vue";

import NoItems from "./NoItems.vue";
import axios from "axios";

export default defineComponent({
  name: "Setting",
  setup() {
    let data: Ref<{
      nicknameEditting: boolean;
      genderEditting: boolean;
      emailEditting: boolean;
      introduceEditting: boolean;
      phoneEditting: boolean;
      addressEditting: boolean;
      passwordEditting: boolean;
      microMsgQRCode: string;
      alipayQRCode: string;
      newPassword: string;
      newRepeatPassword: string;
      tempUserInfo: any;
    }> = ref({
      nicknameEditting: false,
      genderEditting: false,
      emailEditting: false,
      introduceEditting: false,
      phoneEditting: false,
      addressEditting: false,
      passwordEditting: false,
      microMsgQRCode: "",
      alipayQRCode: "",
      newPassword: "",
      newRepeatPassword: "",
      tempUserInfo: undefined,
    });

    let {
      alipayQRCode,
      microMsgQRCode,
      tempUserInfo,
      nicknameEditting,
      phoneEditting,
      emailEditting,
      genderEditting,
      newPassword,
      newRepeatPassword,
      passwordEditting,
    } = toRefs(data.value);
    const userInfo = inject<any>("userInfo", undefined);

    tempUserInfo.value = { ...userInfo.value };

    let methods = {
      changeMicroMsgQRCode(e: any) {
        const file = e.target.files[0];
        if (file) microMsgQRCode.value = URL.createObjectURL(file);
      },
      changeAlipayQRCode(e: any) {
        const file = e.target.files[0];
        if (file) alipayQRCode.value = URL.createObjectURL(file);
      },
      async saveInfo() {
        return axios
          .post(
            "/user/update",
            `user_id=${tempUserInfo.value.user_id}
&user_name=${tempUserInfo.value.user_name}
&user_phone=${tempUserInfo.value.user_phone}
&user_pwd=${tempUserInfo.value.user_pwd}
&user_email=${tempUserInfo.value.user_email}
&user_avatar=${tempUserInfo.value.user_avatar}`
          )
          .then(() => {
            userInfo.value = { ...tempUserInfo.value };
          });
      },
      nicknameSave() {
        if (tempUserInfo.value.user_name.trim() === "") alert("昵称不能为空");
        else {
          this.saveInfo().then((res) => {
            nicknameEditting.value = false;
          });
        }
      },
      phoneSave() {
        if (tempUserInfo.value.user_phone.trim() === "")
          alert("电话号码不能为空");
        else if (
          !/^(?:(?:\+|00)86)?1(?:(?:3[\d])|(?:4[5-79])|(?:5[0-35-9])|(?:6[5-7])|(?:7[0-8])|(?:8[\d])|(?:9[1589]))\d{8}$/.test(
            tempUserInfo.value.user_phone
          )
        )
          alert("电话号码格式不正确");
        else {
          axios
            .post(
              "/user/query/phone",
              `user_phone=${tempUserInfo.value.user_phone}`
            )
            .then((res) => {
              if (res.data.code == 200) {
                this.saveInfo().then((res) => {
                  phoneEditting.value = false;
                });
              } else {
                alert("手机号已被注册");
              }
            });
        }
      },
      emailSave() {
        if (tempUserInfo.value.user_email.trim() === "") alert("邮箱不能为空");
        else if (
          !/^\w+@[\da-z\.-]+\.([a-z]{2,6}|[\u2E80-\u9FFF]{2,3})$/.test(
            tempUserInfo.value.user_email
          )
        )
          alert("邮箱格式不正确");
        else {
          this.saveInfo().then((res) => {
            emailEditting.value = false;
          });
        }
      },
      genderSave() {
        this.saveInfo().then((res) => {
          genderEditting.value = false;
        });
      },
      passwordSave() {
        if (
          !/^\S*(?=\S{6,})(?=\S*\d)(?=\S*[A-Z])(?=\S*[a-z])(?=\S*[!@#$%^&*? ])\S*$/.test(
            newPassword.value
          )
        )
          alert("密码长度至少6位，且必须包含数字、大小写字母及特殊字符");
        else if (newPassword.value !== newRepeatPassword.value)
          alert("两次输入的密码不一致");
        else {
          tempUserInfo.value.user_pwd = newPassword;
          this.saveInfo().then((res) => {
            passwordEditting.value = false;
          });
        }
      },
    };

    return {
      ...toRefs(data.value),
      ...toRefs(methods),
      userInfo,
    };
  },
  components: { NoItems },
});
</script>

<style scoped lang="scss">
.hint-text {
  font-size: 12px;
  color: gray;
}
.table-row {
  &:not(:first-child) {
    margin-top: 40px;
  }

  .label {
    font-weight: bold;
    font-size: 16px;
  }

  .content {
    font-size: 16px;
    .text {
      margin-right: 10px;
      &:empty {
        margin-right: 0;
      }
    }
    .hover-edit {
      display: none;
      color: orange;
      font-size: 15px;
      cursor: pointer;
    }
    &:hover {
      .hover-edit {
        display: inline;
      }
    }
  }
}
.QR-code {
  width: 150px;
  height: 150px;
  padding: 10px;
  border: 1px solid gray;
  border-radius: 4px;
  position: relative;
  &:hover {
    .hover-text {
      display: block;
    }
  }
  .hover-text {
    display: none;
    position: absolute;
    left: 50%;
    transform: translate(-50%, -50%);
    top: 50%;
    background-color: gray;
    color: white;
    padding: 3px 6px;
  }
  .file-selector {
    width: 100%;
    height: 100%;
    opacity: 0;
    position: absolute;
    left: 0;
    top: 0;
    cursor: pointer;
  }
}
</style>
