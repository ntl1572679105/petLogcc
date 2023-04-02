<template>
  <template v-if="reserveList">
    <NoItems v-if="reserveList.length === 0" />
    <el-row>
      <el-col
        :span="12"
        v-for="(item, i) in reserveList"
        :style="{ marginTop: i > 1 ? '60px' : 0 }"
      >
        <Card
          :imgSrc="`http://127.0.0.1:9000${item.petshop_img}`"
          :info="toInfo(item)"
          :title="item.petshop_name"
        />
      </el-col>
    </el-row>
    <el-pagination
      style="justify-content: center"
      :page-size="4"
      layout="prev, pager, next"
      :pager-count="9"
      v-model:current-page="currentPage"
      :total="reserveList.length"
      :hide-on-single-page="true"
      @current-change="handleCurrentChange()"
    />
  </template>
</template>
<style scoped lang="scss"></style>

<script lang="ts">
import axios from "axios";
import { defineComponent, Ref, ref, toRefs, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import NoItems from "./NoItems.vue";
import Card from "./Card.vue";

export default defineComponent({
  name: "Article",
  components: { NoItems, Card },
  setup() {
    const router = useRouter();
    const route = useRoute();
    let data: Ref<{ reserveList: any; currentPage: number }> = ref({
      reserveList: undefined,
      currentPage: Number(route.query.page),
    });

    let { reserveList, currentPage } = toRefs(data.value);

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
          reserveList.value = res.data.data.data;
        });
    });
    let methods = {
      toInfo(reserveList: any) {
        const arr = [];
        arr.push({
          label: "地址：",
          content: reserveList.petshop_address,
        });
        arr.push({
          label: "联系电话：",
          content: reserveList.petshop_phone,
        });
        arr.push({
          label: "洗漱时间：",
          content: new Date(reserveList.wash_time).toLocaleString(),
        });
        return arr;
      },
      handleCurrentChange() {
        router.push(`?page=${currentPage.value}`);
      },
    };

    return {
      ...toRefs(data.value),
      ...methods,
    };
  },
});
</script>
