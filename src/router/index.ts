import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import HomeView from '../views/HomeView.vue'

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
        component: () => import( '../views/Community.vue')
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
  {
    path: '/user/:id',
    name: 'user',
    component: () => import( '../views/User.vue'),
    children:[
      {
        path:'',
        name:'overview',
        component:()=>import('../components/user/Overview.vue')
      },
      {
        path:'published',
        name:'published',
        component:()=>import('../components/user/Published.vue')
      },
      {
        path:'invitation-code',
        name:'invitationCode',
        component:()=>import('../components/user/InvitationCode.vue')
      },
      {
        path:'setting',
        name:'setting',
        component:()=>import('../components/user/Setting.vue')
      },

    ]
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
