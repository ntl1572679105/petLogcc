<template>
    <div class="searchPage">
        <Waterfall :gutter="20"  :list="list" class="waterFall" :width="250" >
            <template #item="{ item, url, index }">
                <div class="card" @click="$router.push(`/home/community/commonent/${item.invitation_id}`)">
                    <LazyImg class="img" :url="item.user_image" />
                    <div class="cont">
                        <p class="text">{{ item.invitation_title }}</p>
                        <ul>
                            <li>
                                <!-- <img src="" alt=""> -->
                                <div class="block">
                                    <el-avatar :size="30" :src="item.user_avatar" />
                                    <span>{{ item.user_name }}</span>
                                </div>

                            </li>
                            <div>
                                <el-icon :size="20"  color="#409EFC"><Star /></el-icon> 
                                {{ item.user_like }}</div>
                    
                        </ul>                        
                    </div>

                    <!-- <SearchContent /> -->
                </div>
            </template>
        </Waterfall>
    </div>
</template>

<script lang="ts" setup>
import {onMounted,reactive} from 'vue'
import httpApi from '@/http'
import { LazyImg, Waterfall } from 'vue-waterfall-plugin-next'
import 'vue-waterfall-plugin-next/dist/style.css'
import { Star } from '@element-plus/icons-vue'
// import SearchContent from '@/components/SearchContent.vue'



const list:Array<object> = reactive([])
onMounted(()=>{
    let params={page:1,pagesize:26}
    httpApi.invitationApi.list(params).then(res=>{
        console.log(res)
        list.push(...res.data.data)
        // console.log(list.user_like)
    })

})





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
                    // background-color: sandybrown;
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
