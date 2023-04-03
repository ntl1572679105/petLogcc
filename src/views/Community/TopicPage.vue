<template>
    <div class="body">
        <div class="container">
            
            <div class="head_box">
                <div class="datetime">
                    <time id="time">{{ time }}</time>
                    <span class="desc">宠物社区搜索</span>
                </div>
            </div>

            <div class="body_box">
                <!-- <div class="menu">
                    <div class="item active" id="0">百度</div>
                    <div class="item" id="1">必应</div>
                    <div class="item" id="2">谷歌</div>
                    <div class="item" id="3">Github</div>
                </div> -->

                <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
                    <el-tab-pane label="User" name="first"> </el-tab-pane>
                    <el-tab-pane label="Config" name="second"> </el-tab-pane>
                    <el-tab-pane label="Role" name="third"> </el-tab-pane>
                    <el-tab-pane label="Task" name="fourth"> </el-tab-pane>
                </el-tabs>

                <div class="logo">
                    <span><a href="/">Mux</a> <span>搜索</span></span>
                </div>
                <div class="search">

                    <input type="text" name="" id="input">
                    <img src="./static/img/search.png" alt="" id="search">
                </div>
            </div>
        </div>

    </div>
</template>

<script setup lang="ts">
import { ref,onMounted} from 'vue'
import { Calendar, Search } from '@element-plus/icons-vue'
import  moment  from "moment"
import type { TabsPaneContext } from 'element-plus'

const activeName = ref('first')

const handleClick = (tab: TabsPaneContext, event: Event) => {
        console.log(tab, event)
}

const time=ref()
setInterval(function(){
    time.value =moment().format("YYYY-MM-DD HH:mm:ss")
    console.log(moment().format("YYYY-MM-DD HH:mm:ss"))

},1000)

onMounted(()=>{
})

</script>

<style lang="scss" scoped>
.body {
    //铺满全屏显示
    position: absolute;
    right: 0;
    width: 100%;
    min-height: 100vh;

    // width: 100vw;
    height: 100vh;
    object-fit: cover;
    background: url("./static/img/bg.jpg") no-repeat left top;
    
    // background: url("https://img0.baidu.com/it/u=3961293425,1471603424&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800") no-repeat left top;
    background-size:100% 100%;
}

.container {
    max-width: 400px;
    width: auto;
    margin: 0 auto;
}

.body_box {
    position: relative;
    top: 200px;
    left: 0px;
    width: auto;
}

.body_box .search {
    float: right;
    background: #fff;
}

.body_box .search,
.body_box .search input {
    border: 2px solid #fff;
    border-radius: 10px;
    width: 528px;
    height: 45px;
    // background: rgba(0, 0, 0, 0.1);
    background-color: transparent;
    display: flex;
    
}

.body_box .search input {
    border: none;
    height: 43px;
    width: 483px;
    float: left;
    outline: none;
    font-size: 32px;
    font-family: "IBM Plex Mono Text", serif;
    color: #ff6b81;
    margin-left: 2px;
}

.body_box .search img {
    line-height: 53px;
    margin-top: 2px;
    margin-right: 3px;
    width: 40px;
    cursor: pointer;
}

.body_box .logo {
    float: left;
    position: relative;
    left: -265px;
    top: 43px;

}

.logo span span {
    font-size: 30px;
}

.logo span a {
    font-size: 33px;
    font-family: "IBM Plex Mono Light", serif;
    text-decoration: none;
    color: #5352ed;
}

.body_box .menu {
    position: relative;
    left: -120px;
    top: 20px;
}

.menu .item {
    color: #fff;
    display: inline-block;
    font-size: 20px;
    cursor: pointer;
    line-height: 30px;
    transition: 0.5s;
}

.menu .active {
    color: #fff;
    padding: 2px;
    border-radius: 5px;
    height: 30px;
    background-color: #70a1ff;
}

.datetime time {
    color: white;
    font-size: 35px;
    position: relative;
    top: 80px;
    font-family: "IBM Plex Mono Light", serif;
    display: block;
}

.datetime .desc {
    position: relative;
    font-family: 文泉驿微米黑, serif;
    color: white;
    top: 100px;
    left: 30%;
    font-size: 20px;
}
</style>