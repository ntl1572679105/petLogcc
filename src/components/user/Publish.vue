<template>
  <div style="margin-bottom: 30px;">
    <el-button @click="$router.push({name:'article',query:{page:1}})" :type="$route.name === 'article' ? 'warning' : 'secondary'"
      >文章</el-button
    ><el-button @click="$router.push({name:'comment',query:{page:1}})" :type="$route.name === 'comment' ? 'warning' : 'secondary'">评论</el-button>
  </div>
  <router-view></router-view>
</template>

<script lang="ts">
import axios from "axios";
import { defineComponent, Ref, ref, toRefs, provide, onMounted } from "vue";


export default defineComponent({
  name: "Home",

  setup() {
  },
  components: {},
});
</script>
