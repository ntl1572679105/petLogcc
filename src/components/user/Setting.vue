<template>
  <h3 style="color: gray">基本资料</h3>
  <!-- 昵称 -->
  <el-row class="table-row">
    <el-col class="label" :span="6"> 昵称</el-col>
    <el-col v-if="!nicknameEditting" class="content" :span="18">
      uyg
      <span class="hover-edit" @click="nicknameEditting = true"
        >编辑</span
      ></el-col
    >
    <el-col v-else class="content" :span="18">
      <el-input style="width: 200px" />
      <div class="hint-text" style="margin-top: 10px">中文、英文或数字</div>
      <div style="margin-top: 10px">
        <el-button plain type="warning" @click="nicknameEditting = false"
          >取消</el-button
        >
        <el-button type="warning">保存</el-button>
      </div>
    </el-col>
  </el-row>
  <!-- 性别 -->
  <el-row class="table-row">
    <el-col class="label" :span="6">性别</el-col>
    <el-col v-if="!genderEditting" class="content" :span="18">
      男
      <span class="hover-edit" @click="genderEditting = true"
        >编辑</span
      ></el-col
    >
    <el-col v-else class="content" :span="18">
      <el-radio-group v-model="gender">
        <el-radio label="1" size="large">男</el-radio>
        <el-radio label="2" size="large">女</el-radio>
      </el-radio-group>
      <div class="hint-text" style="margin-top: 10px">中文、英文或数字</div>
      <div style="margin-top: 10px">
        <el-button plain type="warning" @click="genderEditting = false"
          >取消</el-button
        >
        <el-button type="warning">保存</el-button>
      </div>
    </el-col>
  </el-row>

  <el-row class="table-row">
    <el-col class="label" :span="6">网址</el-col>
    <el-col v-if="!netAddressEditting" class="content" :span="18">
      <span class="hover-edit" @click="netAddressEditting = true"
        >编辑</span
      ></el-col
    >
    <el-col v-else class="content" :span="18">
      <el-input style="width: 200px" />
      <div class="hint-text" style="margin-top: 10px">输入网址</div>

      <div style="margin-top: 10px">
        <el-button plain type="warning" @click="netAddressEditting = false"
          >取消</el-button
        >
        <el-button type="warning">保存</el-button>
      </div>
    </el-col>
  </el-row>
  <el-row class="table-row">
    <el-col class="label" :span="6">一句话介绍自己 </el-col>
    <el-col v-if="!introduceEditting" class="content" :span="18"
      >这个人很懒，什么都没留下<span
        class="hover-edit"
        @click="introduceEditting = true"
        >编辑</span
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
  </el-row>
  <el-row class="table-row">
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
  </el-row>
  <!-- 手机号码 -->
  <el-row class="table-row">
    <el-col class="label" :span="6">绑定手机</el-col>
    <el-col class="content" :span="18">
      <div v-if="!phoneEditting">
        13336719336<span class="hover-edit" @click="phoneEditting = true"
          >编辑</span
        >
      </div>
      <div v-else>
        <el-input style="width: 200px" />

        <div style="margin-top: 10px">
          <el-button plain type="warning" @click="phoneEditting = false"
            >取消</el-button
          >
          <el-button type="warning">保存</el-button>
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
          <el-input style="width: 200px" placeholder="新密码" />
        </div>
        <div style="margin-top: 15px">
          <el-input style="width: 200px" placeholder="重复新密码" />
        </div>

        <div style="margin-top: 10px">
          <el-button plain type="warning" @click="passwordEditting = false"
            >取消</el-button
          >
          <el-button type="warning">保存</el-button>
        </div>
      </div>
      <div class="hint-text" style="margin-top: 10px">
        请确保两次密码一致，并且密码大于6个字符！修改密码后请重新登录
      </div>
    </el-col>
  </el-row>
  <el-row style="margin-top: 30px">头像选择</el-row>
  <el-row style="margin-top: 30px"
    ><img style="width: 100px" src="@/assets/imgs/default-avatar.png" alt=""
  /></el-row>
  <el-row style="margin-top: 30px">社交绑定</el-row>
  <el-row style="margin-top: 30px">
    <el-col :offset="2">
      <div>QQ</div>
      <div>未绑定</div>
      <el-button type="warning">添加绑定</el-button>
    </el-col>
  </el-row>
  <el-row style="margin-top: 30px">上传收款码</el-row>
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
  </el-row>
</template>
<script lang="ts">
import { defineComponent, ref, toRefs } from "vue";
import NoItems from "./NoItems.vue";

export default defineComponent({
  name: "Setting",
  setup() {
    let data = ref({
      nicknameEditting: false,
      genderEditting: false,
      netAddressEditting: false,
      introduceEditting: false,
      phoneEditting: false,
      addressEditting: false,
      passwordEditting: false,
      microMsgQRCode: "",
      alipayQRCode: "",
      gender: "1",
    });
    let { alipayQRCode, microMsgQRCode } = toRefs(data.value);
    let methods = {
      changeMicroMsgQRCode(e: any) {
        const file = e.target.files[0];
        if (file) microMsgQRCode.value = URL.createObjectURL(file);
      },
      changeAlipayQRCode(e: any) {
        const file = e.target.files[0];
        if (file) alipayQRCode.value = URL.createObjectURL(file);
      },
    };

    return {
      ...toRefs(data.value),
      ...toRefs(methods),
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
    font-size: 18px;
  }

  .content {
    font-size: 18px;
    .hover-edit {
      display: none;
      color: orange;
      font-size: 15px;
      cursor: pointer;
      margin-left: 10px;
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
