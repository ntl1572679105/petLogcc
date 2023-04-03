<template>
  <template v-if="articleList">
    <NoItems v-if="articleList.length === 0" />
    <el-row>
      <el-col
        :style="{ 'margin-top': i < 3 ? 0 : '40px' }"
        :span="8"
        v-for="(item, i) in articleList"
      >
        <div style="width: 70%; cursor: pointer; background-color: #f5f5f5">
          <div style="font-size: 14px; font-weight: bold">
            {{ item.invitation_title }}
          </div>
          <div class="article-content" style="">
            {{ item.invitation_content }}
          </div>
          <div style="margin-top: 20px; font-size: 12px; color: #607d8b">
            {{ new Date(item.invitation_time).toLocaleString() }}
          </div>
        </div>
      </el-col>
    </el-row>
    <div style="margin-top: 50px">
      <el-pagination
        style="justify-content: center"
        :page-size="9"
        layout="prev, pager, next"
        :pager-count="9"
        v-model:current-page="currentPage"
        :total="totalItems"
        :hide-on-single-page="true"
        @current-change="handleCurrentChange()"
      />
    </div>
  </template>
</template>
<script lang="ts">
import {
  Ref,
  defineComponent,
  inject,
  onMounted,
  ref,
  toRefs,
  watch,
} from "vue";
import NoItems from "./NoItems.vue";
import { useRoute, useRouter } from "vue-router";
import axios from "axios";

export default defineComponent({
  name: "Article",
  components: { NoItems },
  setup() {
    const router = useRouter();
    const route = useRoute();

    let data: Ref<{
      articleList: any;
      currentPage: number;
      totalItems: any;
      pagesize: any;
      pageKey: any;
    }> = ref({
      articleList: undefined,
      pagesize: 9,
      currentPage: Number(route.query.page),
      totalItems: undefined,
      userId: route.params.id,
      pageKey: 1,
    });

    let { articleList, currentPage, totalItems, pagesize, pageKey } = toRefs(
      data.value
    );
    const userInfo = inject<any>("userInfo", undefined);
    let methods = {
      getArticles(page: number) {
        axios
          .get("/community/list/id", {
            params: {
              user_id: userInfo.value.user_id,
              page,
              pagesize: pagesize.value,
            },
          })
          .then((res) => {
            articleList.value = res.data.data;
            totalItems.value = res.data.total;
          });
      },
      handleCurrentChange() {
        router.push(`?page=${currentPage.value}`);
      },
    };

    watch(
      () => router.currentRoute.value,
      () => {
        if (route.name !== "article") return;
        currentPage.value = Number(route.query.page);
        methods.getArticles(currentPage.value);
      },
      { deep: true }
    );
    onMounted(() => {
      methods.getArticles(currentPage.value);
    });

    return {
      ...toRefs(data.value),
      ...methods,
    };
  },
});
</script>
<style lang="scss">
.article-content {
  color: gray;
  font-size: 12px;
  margin-top: 20px;

  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  line-height: 1.5em;
  max-height: 4.5em;
}
</style>
