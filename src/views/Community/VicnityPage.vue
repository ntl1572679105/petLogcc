<template>
    <el-button type="primary" style="margin-left: 16px" @click="drawer = true">
        open
    </el-button>

    <el-drawer append-to-body="true" v-model="drawer" size="90%" title="I am the title" direction="ltr" :with-header="false">

        <div class="bag">
        <div class="common-layout">
            <el-container style="height: 600px">
                <el-aside class="imgBag" width="600px">
                    <img src="@/views/Community/static/img/雨天.jpg" alt="">
                </el-aside>
                <el-container class="cont">
                    <el-header>
                        <div class="block">
                            <div class="wangming">
                                <el-avatar :size="50" src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png" />
                                <p>用户网名</p>
                                
                            </div>
                            <div class="btn-container">
                                <Transition name="slide-up">
                                    <button v-if="docState === 'saved'" @click="docState = 'edited'">
                                        <el-icon size="x-large"><Star /></el-icon>
                                    </button>
                                    <button v-else-if="docState === 'edited'" @click="docState = 'editing'">
                                        <el-icon size="x-large"><CircleCheckFilled /></el-icon>
                                    </button>
                                    <button v-else-if="docState === 'editing'" @click="docState = 'saved'">
                                        <el-icon size="x-large"><CircleClose /></el-icon>
                                    </button>
                                </Transition>
                            </div>
                        </div>

                    </el-header>
                    
                    <el-main>
                        <el-scrollbar>
                            <el-card class="box-card">
                                <template #header>
                                    <div class="card-header">
                                        <h3>Card name</h3>
                                        <span> 我想在登陆的时候将用户信息存本地一份 仓库一份仓库的方法是调用工具函数里的-从本地取数据-这个方法 但是state里的user就是不能够被actions里拿到的用户数据赋值 能想的办法都试过了 登陆页面的业务逻辑走到存本地之后 后面就不走了 还是actions 里的问题 头大   </span>
                                        <div class="tags">
                                            <span>#前端</span>
                                            <span>#前端开发</span>
                                        </div>
                                        <p>今天 19:05</p>
                                    </div>
                                </template>
                                <div>
                                    <CommonentMain></CommonentMain>
                                </div>
                            </el-card>
                        </el-scrollbar>
                    </el-main>

                    <el-footer>
                        <div class="icon">
                            <el-icon :size="30"><StarFilled /></el-icon>
                            <el-text>392</el-text>
                            <el-icon :size="30"><ChatDotRound /></el-icon>
                            <el-text>1789</el-text>
                            <el-icon :size="30" color="#409EFC" class="no-inherit">
                                <Share />
                            </el-icon>
                        </div>
                        <div>
                            <input type="text" placeholder="说些什么...">
                        </div>
                    </el-footer>
                </el-container>
            </el-container>
        </div>
    </div>
    </el-drawer>
</template>

<script lang="ts" setup>
import { reactive, toRefs,ref } from 'vue'
import { Star,CircleCheckFilled,CircleClose,StarFilled,Share,ChatDotRound} from '@element-plus/icons-vue'
import CommonentMain from '@/components/CommonentMain.vue';
const input = ref('')
const drawer = ref(false)

const docState = ref('saved')

const state = reactive({
    circleUrl:
        'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',
})

const { circleUrl } = toRefs(state)


    components: {
        CommonentMain
    }

</script>

<style scoped lang="scss">
.el-drawer{
    position: relative;
}
.bag {


    // border: 2px solid rgb(0, 0, 0);
    background-color: #f7f7f7;
    // background-color: salmon;

    position: absolute;
    right: 0;
    width: 100%;
    min-height: 100vh;

    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    // z-index: 2;
    transition: 0.5s;

    .common-layout {
        border-radius: 40px;
        background-color: rgb(255, 255, 255);
        position: absolute;
        height: 100%;
        height: 600px;
        color: black;
        .el-container {
            .imgBag {
                // width: 600px;
                // height: 600px;
                display: flex;
                img {
                    object-fit: contain;
                    display: block;
                    width: 100%;
                }
            }
            .cont {
                width: 400px;
                .el-header{
                    height: 80px;
                    width: 400px;
                    // background-color: salmon;
                    .block{
                        position: relative;
                        .wangming{
                            display: flex;
                            height: 80px;
                            .el-avatar{
                                margin-top: 15px;
                                margin-right: 15px;
                            }
                            p{
                                line-height: 80px;
                                font-size: 20px;
                            }
                        }
                        .btn-container{
                            background-color: white;
                            position: absolute; 
                            right: 0; 
                            top: 20px;
                            transition: 1s;
                            button {
                            border-style: none;
                            background-color: white;
                            height: 40px;
                            width: 40px;
                            }
                        }
                    }
                }
                .el-main{
                    width: 400px;
                    // background-color: rgb(251, 242, 162);
                    overflow-x:hidden;
                    overflow-y:hidden;
                    .box-card{
                        border-style: none;
                        // background-color: orange;
                            .card-header{
                                h3{
                                    border: 1ps solid saddlebrown;
                                    margin-bottom: 15px;
                                }
                                span{
                                    font-weight: 400;
                                    font-size: 16px;
                                    line-height: 28px;
                                    white-space: pre-wrap;
                                    overflow-wrap: break-word;
                                    color: #333;
                                }
                                .tags{
                                    margin-top: 10px;
                                    margin-bottom: 15px;
                                }
                            }

                    }
                }
                .el-footer{
                    width: 400px;
                    height: 130px;
                    .icon{
                        width: 400px;
                        height: 40px;
                        margin-top: 10px;
                        .el-icon{
                            margin-left: 15px;
                        }
                    }
                    div{
                        input{
                            text-indent:2rem;
                            background-color: #f2eeee;
                            width: 300px;
                            height: 40px;
                            margin-top: 10px;
                            font-size: 15px;
                            border-radius: 20px;
                            border-style: none;
                            outline:none;
                            &:focus::-webkit-input-placeholder {//设置点击后placeholder的样式变化
                                color: #c2c2c2; 
                            }
                        }
                    }
                }
            }
        }
    }

}
</style>