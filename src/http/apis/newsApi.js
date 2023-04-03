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
     * 新增新闻
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
    },
    /**
     * 模糊查询新闻列表
     * @param {object} params {keyword:string,page:number,pagesize:number}
     */
    listByName(params){
        let url = BMDURL + '/news/list/name'
        return myaxios.get(url,params)
    },
    /**
     * 通过id查询新闻列表
     * @param {object} params {news_id:number}
     */
    listById(params){
        let url = BMDURL + '/news/list/id'
        return myaxios.get(url,params)
    }

}
export default newsApi