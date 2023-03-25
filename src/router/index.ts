import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import communityChildren from './children/community.js'

const routes: Array<RouteRecordRaw> = [
  {
    path:'/',
    redirect:'/home/index'
  },
  {
    path: '/home',
    name: 'home',
    component: HomeView,
    children:[
      {
        path: 'index',
        name: 'index',
        component: () => import( '../views/Index.vue')
      },
      {
        path: 'petshop',
        name: 'petshop',
        component: () => import( '../views/PetShop.vue')
      },

      {
        path: 'community',
        name: 'community',
        component: () => import( '../views/Community.vue'),
        redirect:'/home/community/index',
        children:communityChildren
      //   children: [
      //     {
      //     path: 'index',
      //     name: 'CommunityIndex',
      //     component: () => import('../views/Community/HomePage.vue'),
      //     },
      //     {
      //       path: 'search',
      //       name: 'CommunitySearch',
      //       component: () => import('../views/Community/SearchPage.vue'),
      //       },
      // ]
      },

      {
        path: 'news',
        name: 'news',
        component: () => import( '../views/News.vue')
      },
      {
        path: 'science',
        name: 'science',
        component: () => import( '../views/Science.vue')
      },
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: () => import( '../views/Login.vue')
  },
  {
    path: '/regist',
    name: 'regist',
    component: () => import( '../views/Regist.vue')
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
