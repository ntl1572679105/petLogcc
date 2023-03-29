const PetServices = [
    {
        path: 'shower',
        component: () => import('@/views/PetServices/Shower.vue'),
    },
    {
        path: 'buy',
        component: () => import('@/views/PetServices/Buy.vue')
    },
    {
        path: 'foster-care',
        component: () => import('@/views/PetServices/FosterCare.vue'),
    },
    {
        path: 'photo',
        component: () => import('@/views/PetServices/Photo.vue')
    },
]

export default PetServices