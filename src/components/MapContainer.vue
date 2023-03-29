<template>
  <div id="container"></div>
</template>
<script>
import AMapLoader from "@amap/amap-jsapi-loader";
import { shallowRef } from "@vue/reactivity";
export default {
  name: "mapcomtaint",
  setup() {
    const map = shallowRef(null);
    return {
      map,
    };
  },
  create() {},
  methods: {
    ininMap() {
      AMapLoader.load({
        key: "6c8f476c5933102b7040be17d2d5fd68", //设置您的key
        version: "2.0",
        plugins: [],
        AMapUI: {
          version: "1.1",
          plugins: [],
        },
        Loca: {
          version: "2.0.0",
        },
      })
        .then(AMap => {
          this.map = new AMap.Map("container", {
            viewMode: "3D",
            zoom: 11,
            zooms: [2, 22],
            center: [120.210792, 30.246026],
          });
          let positionArr = [
            [113.357224, 34.977186],
            [114.555528, 37.727903],
            [112.106257, 36.962733],
            [109.830097, 31.859027],
            [116.449181, 39.98614],
          ];
          for (let item of positionArr) {
            let marker = new AMap.Marker({
              position: [item[0], item[1]],
            });
            this.map.add(marker);
          }
        })
        .catch(e => {
          console.log(e);
        });
    },
    addMarker() {},
  },
  mounted() {
    //DOM初始化完成进行地图初始化
    this.ininMap();
  },
  unmounted() {
    // 页面跳转销毁地图
    console.log(1);
    this.map.destroy();
  },
};
</script>
<style scope>
.home_div {
  height: 100%;
  width: 100%;
  padding: 0px;
  margin: 0px;
  position: relative;
}
#container {
  height: 100%;
  width: 100%;
  padding: 0px;
  margin: 0px;
}
.map-title {
  position: absolute;
  z-index: 1;
  width: 100%;
  height: 50px;
  background-color: rgba(27, 25, 27, 0.884);
}
h3 {
  position: absolute;
  left: 10px;
  z-index: 2;
  color: white;
}
</style>
