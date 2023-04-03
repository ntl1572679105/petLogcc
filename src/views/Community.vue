<template>
    <div class="bg">
        <CommunityHeader />

        <div class="block">  </div>
        <el-main>
            <router-view />
        </el-main>
        测试社区主页
    </div>
</template>

<script>
import CommunityHeader from "@/components/CommunityHeader"

export default {
    components: {
        CommunityHeader
    },
};

</script>

<style lang="scss" scoped>
.block{
    height: 22px;
}



</style>