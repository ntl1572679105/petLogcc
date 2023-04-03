<template>
    <div class="menu-item">
        <img class="img" src="../assets/pagelogo.png" alt="">
        <el-menu :default-active="activeIndex" class="el-menu-demo el-menu--horizontal" mode="horizontal" @select="handleSelect" router collapse-transition="false">
            <el-input  :suffix-icon="Search" class="search-input" v-model="input" placeholder="请输入内容"></el-input>
            <el-menu-item index="/home/community/index">首页</el-menu-item>
            <el-menu-item index="/home/community/search">发现</el-menu-item>
            <el-menu-item index="/home/community/vicnity">附近</el-menu-item>
            <el-menu-item index="/home/community/topic">搜索</el-menu-item>
            <div class="avatar">
                <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
            </div>
            
        </el-menu>
    </div>
</template>

<script>
import { Search } from '@element-plus/icons-vue'
    export default {
        data() {
            return {
                input: ''
            }
        }
        
    }
</script>

<style lang="scss" scoped>
.menu-item{
    display: flex;
    justify-content: space-between;
    margin-top: -18px;
    background-color: #F7F7F7;
    //横屏100%
    position: absolute;
    right: 0;
    width: 100%;

    
    // min-height: 100vh;
    .img{
        display: block;
        object-fit: cover;
        width: 90px;
        height: 60px;
        margin-left: 5%;
    }
    .el-menu-demo{
        width: 600px;
        border-bottom: none;
        background-color: #F7F7F7;

        .search-input{
            width: 200px;
            height: 40px;
            margin-top: 10px;
            border-radius: 20px;
        }
        // .avatar{
        //     vertical-align: middle;
        // }
    }

}


</style>