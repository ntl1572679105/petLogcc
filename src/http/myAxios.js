//先导入
// 发送get请求
// @param{string} url
//     @params{object} params
import axios from 'axios'
import qs from 'qs'
import store from '@/store'
const instance = axios.create()
const myaxios = {
    get(url, params) {
        return instance({
            url,
            method: "get",
            params,
        })
    },

    post(url, params) {
        return instance({
            url,
            method: "post",
            data: qs.stringify(params),
        })
    },

}
export default myaxios;