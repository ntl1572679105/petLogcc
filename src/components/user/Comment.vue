<template>
  <div v-if="commentList">
    <NoItems v-if="commentList.length === 0" />
    <div
      style="display: flex; align-items: center; margin-bottom: 20px"
      v-for="item in commentList"
    >
      <img
        style="width: 40px; border-radius: 5px; margin-right: 30px"
        :src="userInfo.user_avatar"
      />
      <div>
        <div style="margin-bottom: 10px; font-weight: bold; font-size: 14px">
          {{ userInfo.user_name }}
        </div>
        <div v-html="item.commenton_content"></div>
      </div>
    </div>
    <el-pagination
      style="justify-content: center"
      :page-size="10"
      layout="prev, pager, next"
      :pager-count="9"
      v-model:current-page="currentPage"
      :total="commentList.length"
      :hide-on-single-page="true"
      @current-change="handleCurrentChange()"
    />
  </div>
</template>

<script lang="ts">
import axios from "axios";
import { defineComponent, Ref, ref, toRefs, onMounted, inject } from "vue";
import { useRoute, useRouter } from "vue-router";
import NoItems from "./NoItems.vue";

export default defineComponent({
  name: "Article",
  components: { NoItems },
  setup() {
    const router = useRouter();
    const route = useRoute();
    const userInfo = inject<any>("userInfo", undefined);

    let data: Ref<{ commentList: any; avatarSrc: any; currentPage: number }> =
      ref({
        commentList: undefined,
        avatarSrc: userInfo.value.user_avatar,
        currentPage: Number(route.query.page),
      });

    let { commentList, avatarSrc,currentPage } = toRefs(data.value);

    onMounted(() => {
      axios
        .get("/community/list/commenton/user", {
          params: {
            user_id: useRoute().params.id,
          },
        })
        .then((res) => {
          console.log(res.data.data);
          commentList.value = res.data.data;
        });
    });
    let methods = {
      handleAvatarError(e: any) {
        avatarSrc.value = require("@/assets/user/imgs/default-avatar.png");
      },
      handleCurrentChange() {
        router.push(`?page=${currentPage.value}`);
      },
    };

    return {
      ...toRefs(data.value),
      ...methods,
      userInfo,
    };
  },
});
</script>
