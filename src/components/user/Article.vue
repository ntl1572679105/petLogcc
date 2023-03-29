<template>
  <el-row v-if="articleList">
    <NoItems v-if="articleList.length===0"/>
    <el-col style="margin-bottom: 20px;" :span="8" v-for="item in articleList">
      <div style="width: 70%;cursor: pointer;">
        <div style="font-size: 14px;font-weight: bold;">{{ item.invitation_title }}</div>
        <div class="article-content" style="">
          {{ item.invitation_content }}
        </div>
        <div style="margin-top: 20px; font-size: 12px;color:#607d8b;">
          {{ new Date(item.invitation_time).toLocaleString() }}
        </div>
      </div>
    </el-col>
  </el-row>
</template>
<script lang="ts">
import { Ref, defineComponent, onMounted, ref, toRefs } from "vue";
import NoItems from "./NoItems.vue";
import { useRoute } from "vue-router";
import axios from "axios";

export default defineComponent({
  name: "Article",
  components: { NoItems },
  setup() {
    let data: Ref<{ articleList: any }> = ref({
      articleList: undefined,
    });

    let { articleList } = toRefs(data.value);

    onMounted(() => {
      axios
        .get("/community/list/id", {
          params: {
            user_id: useRoute().params.id,
            page: 1,
            pagesize: 2,
          },
        })
        .then((res) => {
          articleList.value = res.data.data;
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
