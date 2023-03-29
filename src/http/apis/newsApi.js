import BaseUrl from "@/http/BaseUrl";
import myaxios from "../myAxios";
const BMDURL = BaseUrl.BMDURL
const newsApi = {
    /**
     * 查询所有新闻列表
     * @param {object} params  {page:1,pagesize:10} 
     */
    list(params){
        let url = BMDURL + '/news/list'
        return myaxios.get(url,params)
    },
    /**
     * 
     * @param {object}  params {news_title:string,news_img:string,news_content:string,news_time:number}
     */
    add(params){
        let url = BMDURL + '/news/add'
        return myaxios.post(url,params)
    },
    /**
     * 通过id删除新闻
     * @param {object} params {news_id:string}
     */
    del(params){
        let url = BMDURL + '/news/del'
        return myaxios.post(url,params)
    },
    /**
     * 通过id,修改新闻
     * @param {object} params {news_title:string,news_img:string,news_content:string,news_time:string,news_id:string}
     */
    update(params){
        let url = BMDURL + '/news/update'
        return myaxios.post(url,params)
    }
}
export default newsApi