<template>
  <div
    style="
      width: 70%;
      display: flex;
      align-items: start;
      /* border: 1px solid #c5c5c5; */
      border-radius: 4px;
      padding: 0 20px 40px;
    "
  >
    <img
      style="width: 130px; margin-right: 30px; border-radius: 4px"
      :src="imgSrc"
    />
    <div>
      <div style="">
        <h3 class="petshop-name" style="margin-top: 0">
          {{ title }}
        </h3>
      </div>

      <div class="petshop-info" v-for="item in info">
        <span class="info-label">{{ item.label }}</span
        >{{ item.content }}
      </div>

      <div>
        <el-button style="width: 100%;margin-top: 10px;" type="primary" plain size="small"
          >详情信息</el-button
        >
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import axios from "axios";
import { defineComponent, Ref, ref, toRefs, onMounted } from "vue";
import { useRoute } from "vue-router";
import NoItems from "./NoItems.vue";

type Info = {
  label: String;
  content: String;
}[];

export default defineComponent({
  name: "Article",
  components: { NoItems },
  props: {
    imgSrc: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
    info: {
      type: Object as () => Info,
      required: true,
    },
  },
  setup(props: any) {
    let data: Ref<{ reserveList: any }> = ref({
      reserveList: undefined,
    });

    let { reserveList } = toRefs(data.value);

    let methods = {};

    return {
      ...toRefs(data.value),
      ...methods,
      ...props,
    };
  },
});
</script>

<style scoped lang="scss">
// .table-row {
//   margin-top: 30px;
//   font-size: 14px;
// }
.petshop-info {
  display: flex;
  font-size: 12px;
  margin-top: 10px;
  .info-label {
    font-weight: bold;
    flex-shrink: 0;
    flex-basis: 5em;
    font-size: 13px;
  }
}
.petshop-name {
  // font-size: 30px;
  // font-weight: bold;
  // margin: 0;
  // position: absolute;
  // right: 0;
  // top: 0%;
  // background-color: rgba(255,255,255,.2);
  // border-radius:0 0 0 50%;
  // padding: 0 0 10px 20px;
  // color: black;
}
</style>
