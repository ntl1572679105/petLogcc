<template>
  <el-row style="font-size: 14px">
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
  </el-row>
</template>
<style scoped lang="scss">
.table-row {
  margin-top: 30px;
  font-size: 14px;
}
</style>

<script lang="ts">
import axios from 'axios';
import { defineComponent, Ref, ref, toRefs, onMounted } from 'vue';
import { useRoute } from 'vue-router';
import NoItems from "./NoItems.vue";

export default defineComponent({
  name: "Article",
  components: { NoItems },
  setup() {
    let data: Ref<{ commentList: any }> = ref({
      commentList: undefined,
    });

    let { commentList } = toRefs(data.value);

    onMounted(() => {
      axios
        .get("/petshop/getwashByUserId", {
          params: {
            user_id: useRoute().params.id,
            pno:1,
            count:2
          },
        })
        .then((res) => {
          console.log(res.data.data.data);
          // commentList.value = res.data.data;
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
