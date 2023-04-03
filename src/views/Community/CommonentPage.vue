<template>
    <div class="bag" @click="back($event)">
        <div class="common-layout">
            <el-container style="height: 600px" :form="form" v-if="form">
                <el-aside class="imgBag" width="600px">
                    <img :src="form.user_image" alt="" />
                </el-aside>
                <el-container class="cont">
                    <el-header>
                        <div class="block">
                            <div class="wangming">
                                <el-avatar :size="50"
                                    src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png" />
                                <p>{{ form.user_name }}</p>
                            </div>
                            <div class="btn-container">
                                <Transition name="slide-up">
                                    <button v-if="docState === 'saved'" @click="docState = 'edited'">
                                        <el-icon size="x-large">
                                            <Star />
                                        </el-icon>
                                    </button>
                                    <button v-else-if="docState === 'edited'" @click="docState = 'editing'">
                                        <el-icon size="x-large">
                                            <CircleCheckFilled />
                                        </el-icon>
                                    </button>
                                    <button v-else-if="docState === 'editing'" @click="docState = 'saved'">
                                        <el-icon size="x-large">
                                            <CircleClose />
                                        </el-icon>
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
                                        <span> {{ form.invitation_content }}</span>
                                        <div class="tags">
                                            <span>#前端</span>
                                            <span>#前端开发</span>
                                        </div>
                                        <p>{{form.invitation_time}}</p>
                                    </div>
                                </template>
                                <div>
                                    评论区
                                    <!-- <CommunityTree></CommunityTree> -->
                                    <punglun :com="com"></punglun>
                                </div>
                            </el-card>
                        </el-scrollbar>
                    </el-main>

                    <el-footer>
                        <div class="icon">
                            <el-icon :size="30">
                                <StarFilled />
                            </el-icon>
                            <el-text>392</el-text>
                            <el-icon :size="30">
                                <ChatDotRound />
                            </el-icon>
                            <el-text>1789</el-text>
                            <el-icon :size="30" color="#409EFC" class="no-inherit">
                                <Share />
                            </el-icon>
                        </div>
                        <div>
                            <input type="text" placeholder="说些什么..." />
                        </div>
                    </el-footer>
                </el-container>
            </el-container>
        </div>
    </div>
</template>

<script lang="ts" setup>
import {
    Star,
    CircleCheckFilled,
    CircleClose,
    StarFilled,
    Share,
    ChatDotRound,
} from "@element-plus/icons-vue";
import { reactive, toRefs, ref, onMounted } from "vue";
import { useRouter, useRoute } from "vue-router";
import httpApi from "@/http";
import { divide } from "lodash";
import CommunityTree from "@/components/CommoentTree.vue"
import comment from "@/components/comment.vue"
import demo from "@/components/demo.vue"
import punglun from "@/components/punglun.vue"


const input = ref("");
const docState = ref("saved");
let router = useRouter();
let route = useRoute();
let id = Number(route.params.invitation_id);
const state = reactive({
    circleUrl:
        "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
});
interface list {
    invitation_id: string;
    invitation_title: string;
    invitation_content: number;
    invitation_time: number;
    user_id: number;
    invitation_state: number;
    user_image: string;
    user_name:string;
    user_img:string;
}
const com =  ref()
const form = ref<list>();
onMounted(() => {
    let params = { invitation_id: id };
    httpApi.invitationApi.listCommentonByinvitationId(params).then((res) => {
        console.log(res);
        form.value = res.data.data[0];
    });
    httpApi.invitationApi.listCommentonById(params).then(res=>{
        console.log(res)
        com.value = res.data.result
    })

});
// const back = function(e:any){
    
    
// }
const back = (e:any)=>{
    console.log(e)
    if(e.target.className == 'bag'){
        router.back()
    }
    
}
const { circleUrl } = toRefs(state);
</script>

<style lang="scss" scoped>
.btn-container {
    height: 40px;
    width: 40px;
}

.slide-up-enter-active,
.slide-up-leave-active {
    transition: all 0.25s ease-out;
}

.slide-up-enter-from {
    opacity: 0;
    transform: translateY(30px);
}

.slide-up-leave-to {
    opacity: 0;
    transform: translateY(-30px);
}

.bag {
    border: 2px solid rgb(0, 0, 0);
    background-color: #f7f7f7;
    position: relative;
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

                .el-header {
                    height: 80px;
                    width: 400px;

                    // background-color: salmon;
                    .block {
                        position: relative;

                        .wangming {
                            display: flex;
                            height: 80px;

                            .el-avatar {
                                margin-top: 15px;
                                margin-right: 15px;
                            }

                            p {
                                line-height: 80px;
                                font-size: 20px;
                            }
                        }

                        .btn-container {
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

                .el-main {
                    width: 400px;
                    // background-color: rgb(251, 242, 162);
                    overflow-x: hidden;
                    overflow-y: hidden;

                    .box-card {
                        border-style: none;

                        // background-color: orange;
                        .card-header {
                            h3 {
                                border: 1ps solid saddlebrown;
                                margin-bottom: 15px;
                            }

                            span {
                                font-weight: 400;
                                font-size: 16px;
                                line-height: 28px;
                                white-space: pre-wrap;
                                overflow-wrap: break-word;
                                color: #333;
                            }

                            .tags {
                                margin-top: 10px;
                                margin-bottom: 15px;
                            }
                        }
                    }
                }

                .el-footer {
                    width: 400px;
                    height: 130px;

                    .icon {
                        width: 400px;
                        height: 40px;
                        margin-top: 10px;

                        .el-icon {
                            margin-left: 15px;
                        }
                    }

                    div {
                        input {
                            text-indent: 2rem;
                            background-color: #f2eeee;
                            width: 300px;
                            height: 40px;
                            margin-top: 10px;
                            font-size: 15px;
                            border-radius: 20px;
                            border-style: none;
                            outline: none;

                            &:focus::-webkit-input-placeholder {
                                //设置点击后placeholder的样式变化
                                color: #c2c2c2;
                            }
                        }
                    }
                }
            }
        }
    }
}</style>
