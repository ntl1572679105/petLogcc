<template>
  <div>
    <el-main>
      <div id="container"></div>
    </el-main>
  </div>
</template>

<script lang="ts" setup>
import { onUnmounted, defineComponent, reactive, onMounted, ref } from "vue";
import AMapLoader from "@amap/amap-jsapi-loader";
const map = ref(null);
const lat = 120.212;
const lng = 30.246;
const options = reactive({
  key: "6c8f476c5933102b7040be17d2d5fd68", //此处填入我们注册账号后获取的Key
  version: "2.0", //指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
  plugins: ["AMap.Scale"], //需要使用的的插件列表，如比例尺'AMap.Scale'等
  viewMode: "3D", //是否为3D地图模式
  zoom: 11, //初始化地图级别
  center: [lat, lng], //初始化地图中心点位置
});
function initMap() {
  AMapLoader.load(options)
    .then(AMap => {
      map.value = new AMap.Map("container", options);
    })
    .catch(e => {
      console.log("e", e);
    });
}
onMounted(() => {
  initMap();
});
onUnmounted(() => {
  map.value = null;
});
</script>

<style scoped>
#container {
  padding: 0px;
  margin: 0px;
  width: 350px;
  height: 400px;
}
</style>
