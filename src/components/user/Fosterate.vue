<template>
  <el-row>
    <el-col :span="6" v-for="item in reserveList">
      <div style="width: 80%">
        <div style="position: relative">
          <img
            style="width: 100%; border-radius: 4px"
            :src="`http://127.0.0.1:9000${item.petshop_img}`"
          />
          <h3 class="petshop-name" style="">丢丢宠物</h3>
        </div>

        <div class="petshop-info" style="display: flex">
          <span class="info-label">地址：</span>{{ item.petshop_address }}
        </div>
        <div class="petshop-info">
          <span class="info-label">联系电话：</span> {{ item.petshop_phone }}
        </div>
        <div class="petshop-info">
          <span class="info-label">洗漱时间：</span
          >{{ new Date(item.wash_time).toLocaleString() }}
        </div>
      </div>
    </el-col>
  </el-row>
  <!-- <el-row style="font-size: 14px">
    <el-col :span="3"> 编号 </el-col>
    <el-col :span="9"> 邀请码 </el-col>
    <el-col :span="4"> 奖励</el-col>
    <el-col :span="4"> 使用状态</el-col>
    <el-col :span="4"> 使用者</el-col>
  </el-row>
  <el-row class="table-row">
    <el-col :span="3"> 1 </el-col>
    <el-col :span="9"> A11D33E15A6EC99F667D </el-col>
    <el-col :span="4"> 100</el-col>
    <el-col :span="4"> 未使用</el-col>
    <el-col :span="4"> 未使用</el-col>
  </el-row> -->
</template>
<style scoped lang="scss">
.table-row {
  margin-top: 30px;
  font-size: 14px;
}
.petshop-info {
  display: flex;
  font-size: 14px;
  .info-label {
    flex-shrink: 0;
    flex-basis: 5em;
  }
}
.petshop-name {
  font-size: 30px;
  font-weight: bold;
  margin: 0;
  position: absolute;
  right: 0;
  top: 0%;
  background-color: rgba(255,255,255,.2);
  border-radius:0 0 0 50%;
  padding: 0 0 10px 20px;
  color: black;
}
</style>

<script lang="ts">
import axios from "axios";
import { defineComponent, Ref, ref, toRefs, onMounted } from "vue";
import { useRoute } from "vue-router";
import NoItems from "./NoItems.vue";

export default defineComponent({
  name: "Fosterate",
  components: { NoItems },
  setup() {
    let data: Ref<{ reserveList: any }> = ref({
      reserveList: undefined,
    });

    let { reserveList } = toRefs(data.value);

    onMounted(() => {
      axios
        .get("/petshop/getwashByUserId", {
          params: {
            user_id: useRoute().params.id,
            pno: 1,
            count: 2,
          },
        })
        .then((res) => {
          console.log(res.data.data.data);
          reserveList.value = res.data.data.data;
        });
    });
    let methods = {};

    return {
      ...toRefs(data.value),
      ...methods,
    };
  },
});
</script>
