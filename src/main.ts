import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import ElementPlus from "element-plus";
import "element-plus/dist/index.css";

import axios from "axios";
axios.defaults.baseURL="http://127.0.0.1:3000"

createApp(App).use(store).use(router).use(ElementPlus).mount("#app");

