<template>
  <div v-if="commentList">
    <NoItems v-if="commentList.length === 0" />
    <div v-for="item in commentList">
      <div style="margin-bottom: 20px" v-html="item.commenton_content"></div>
    </div>
  </div>
</template>

<script lang="ts">
import axios from "axios";
import { defineComponent, Ref, ref, toRefs, onMounted } from "vue";
import { useRoute } from "vue-router";
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
    let methods = {};

    return {
      ...toRefs(data.value),
      ...methods,
    };
  },
});
</script>
