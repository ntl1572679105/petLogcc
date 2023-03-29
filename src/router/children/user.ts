export default [
  {
    path: "",
    name: "overview",
    component: () => import("@/components/user/Overview.vue"),
  },
  {
    path: "article",
    name: "article",
    component: () => import("@/components/user/Article.vue"),
  },
  {
    path: "reservation",
    name: "reservation",
    component: () => import("@/components/user/Reserve.vue"),
  },
  {
    path: "setting",
    name: "setting",
    component: () => import("@/components/user/Setting.vue"),
  },
  {
    path: "comment",
    name: "comment",
    component: () => import("@/components/user/Comment.vue"),
  },
];
