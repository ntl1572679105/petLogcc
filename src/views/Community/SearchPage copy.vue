<template>
    <div class="searchPage">
        <Waterfall :gutter="20"  :list="list" class="waterFall" :width="250">
            <template #item="{ item, url, index }">
                <div class="card">
                    <LazyImg class="img" :url="url" />
                    <div class="cont">
                        <p class="text">这是chang标题</p>
                        <ul>
                            <li>
                                <!-- <img src="" alt=""> -->
                                <span>头像|</span>
                                <span>网名</span>
                            </li>
                            <div>爱心</div>
                            <!-- <el-icon :size="size" :color="color">
                            <Edit />
                            </el-icon> -->
                        </ul>                        
                    </div>

                    <!-- <SearchContent /> -->
                </div>
            </template>
        </Waterfall>
    </div>
</template>

<script lang="ts" setup>
import {onMounted} from 'vue'
import httpApi from '@/http'
import { LazyImg, Waterfall } from 'vue-waterfall-plugin-next'
import 'vue-waterfall-plugin-next/dist/style.css'
// import SearchContent from '@/components/SearchContent.vue'


export default {
    data() {
        return {
            list: [
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
            { src: "https://game.gtimg.cn/images/yxzj/img201606/skin/hero-info/150/150-bigskin-6.jpg",  },
        ]
        }
    },
    components: {
        LazyImg,
        Waterfall
    }
}

const search=function(){
    let params={user_id:1,page:1,pagesize:2}
    httpApi.invitationApi.list(params).then(res=>{
        console.log(res)
    })

}

</script>

<style lang="scss" scoped >
.searchPage{
    width: 80vw;
    margin: 0 auto;
    .waterFall{
        // border: 1px solid saddlebrown;
        margin-bottom: 30px;
        .card{
            .img{
                border-radius: 17px;
            }
            .cont{
                margin-top: 15px;
                p{
                    width: 100%;
                    background-color: sandybrown;
                }
                ul{
                    list-style: none;
                    display: flex;
                    justify-content: space-between;
                    margin: 7px;
                }
            }
        }
    }
}
// .searchPage {
//     height: 100vh;
// }
</style>
