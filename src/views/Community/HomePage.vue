<template>
    <div class="body" id="box" ref="bottom">
        <CommunityBody />

    </div>
</template>

<script setup lang="ts">
import CommunityBody from "@/components/CommunityBody.vue"
import {ref,onMounted,nextTick} from 'vue'

const bottom=ref<HTMLAreaElement |  null>(null)

onMounted(()=>{
    console.log(111)
    document.documentElement.scrollTop = document.documentElement.scrollHeight;
})
nextTick(()=>{
    console.log(document)
    bottom.value && bottom.value.focus()

})




// export default {
//     components: {
//         CommunityBody
//     },
    

// }

</script>

<style lang="scss" scoped>

</style>


