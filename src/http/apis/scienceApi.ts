import BaseUrl from "@/http/BaseUrl";
import myaxios from "../MyAxios";
const BMDURL = BaseUrl.BMDURL

const scienceApi = {
        /**
     * 查询科普列表
     * @param {object} params {page:number,pagesize:number} 
     */
        list(params:{page:number,pagesize:number} ){
            let url = BMDURL + 'Encyclopedias/list'
            return myaxios.get(url,params)
        },
        /**
         * 新增科普
         * @param {object} params {science_title:string;science_img,string,science_content:string}
         */
        add(params:{science_title:string;science_img:string,science_content:string}){
            let url = BMDURL + 'Encyclopedias/add'
            return myaxios.post(url,params)
        },
        /**
         * 删除科普
         * @param {object} params {science_id:number}
         */
        del(params:{science_id:number}){
            let url = BMDURL + 'Encyclopedias/del'
            return myaxios.post(url,params)
        },
        /**
         * 修改科普
         * @param {object} params {science_title:string,science_img:string,science_content:string,science_id:number}
         */
        update(params:{science_title:string,science_img:string,science_content:string,science_id:number}){
            let url = BMDURL + 'Encyclopedias/update'
            return myaxios.post(url,params)
        },
        /**
     * 模糊查询科普
     * @param {object} params {keyword:string,page:number,pagesize:number}
     */
    listByName(params:{keyword:string,page:number,pagesize:number}){
        let url = BMDURL + '/Encyclopedias/list/name'
        return myaxios.get(url,params)
    },
    /**
 * 根据科普id查询科普信息
 * @param {object} params {science_id:number}
 */
    listById(params:{science_id:number}){
        let url = BMDURL + '/Encyclopedias/list/id'
        return myaxios.get(url,params)
    }
}
export default scienceApi