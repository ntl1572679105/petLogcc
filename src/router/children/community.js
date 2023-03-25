const childrenRoutes = [
    {
        path: 'index',
        name: 'CommunityIndex',
        component: () => import('../views/Community/HomePage.vue'),
    },
    {
        path: 'search',
        name: 'CommunitySearch',
        component: () => import('../views/Community/SearchPage.vue'),
    },
]
export default childrenRoutes