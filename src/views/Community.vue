<template>
    <div>
        <CommunityHeader />
        
        <el-main>
            <router-view/>
        </el-main>
        
    </div>
</template>

<script>
import CommunityHeader from "../components/CommunityHeader"
export default {
    components: {
        CommunityHeader
    }
}
</script>

<style lang="scss" scoped></style>