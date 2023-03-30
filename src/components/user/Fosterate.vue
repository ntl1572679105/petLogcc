<template>
  寄养
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
