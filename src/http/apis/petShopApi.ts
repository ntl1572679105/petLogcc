import axios from "axios";
import qs from 'qs'
import BaseUrl from "@/http/BaseUrl";
import myaxios from "../MyAxios";
const BMDURL = BaseUrl.BMDURL
const petshopApi = {
    /**
     * 宠物店新增商品
     * @param {object} params {commondity_name：string} 
     */
    addShop(params:{commondity_name:string} ){
        let url = BMDURL + '/petshop/addcommodity'
        return myaxios.post(url,params)
    },
    /**
     * 管理员修改商品状态
     * @param {object} params {state:string,commondity_id:number}
     * @returns 
     */
    updateComState(params:{state:string,commondity_id:number}){
        let url = BMDURL + '/petshop/updatestate'
        return myaxios.post(url,params)
    },
    /**
     * 宠物店查询商品
     * @param {object} params {petshop_id:number,pno:number,count:number}
     * @returns 
     */
    listShop(params:{petshop_id:number,pno:number,count:number}) {
        let url = BMDURL + '/petshop/getcommondity'
        return myaxios.get(url,params)
    },
    /**
     * 宠物店修改商品
     * @param {object} params {commondity_name:string, commondity_description:string, commondity_img:string, commondity_price:string, commondity_id:number}
     * @returns 
     */
    updateShop(params:{commondity_name:string, commondity_description:string, commondity_img:string, commondity_price:string, commondity_id:number}) {
        let url = BMDURL + '/petshop/updatecommondity'
        return myaxios.post(url,params)
    },
    /**
     * 宠物店删除商品
     * @param {object} params {commondity_id:number}
     * @returns 
     */
    delShop(params:{commondity_id:number}) {
        let url = BMDURL + '/petshop/deletecommondity'
        return myaxios.post(url,params)
    },
    /**
     * 用户预约洗护
     * @param {object} params {type_id:number, wash_time:number, user_id:number, petshop_id:number}
     * @returns 
     */
    addWash(params:{type_id:number, wash_time:number, user_id:number, petshop_id:number}) {
        let url = BMDURL + '/petshop/addwash'
        return myaxios.post(url,params)
    },
    /**
     * 宠物店修改预约状态
     * @param {object} params {wash_id :number}
     * @returns 
     */
    updateWashState(params:{wash_id :number}) {
        let url = BMDURL + '/petshop/updatewashstate'
        return myaxios.post(url,params)
    },
    /**
     * 用户跟读预约的用户id显示预约信息
     * @param {object} params {user_id:number, pno:number, count:number}
     * @returns 
     */
    listWashByUserId(params:{user_id:number, pno:number, count:number}) {
        let url = BMDURL + '/petshop/getwashByUserId'
        return myaxios.get(url,params)
    },
    /**
     * 新增预约类型
     * @param {object} params {type_name:string, price:number, petshop_id:number}
     * @returns 
     */
    addWashType(params:{type_name:string, price:number, petshop_id:number}) {
        let url = BMDURL + '/petshop/addwashType'
        return myaxios.post(url,params)
    },
    /**
     * 查询所有宠物店
     * @param {object} params { pno:number, count:number}
     * @returns 
     */
    listAllPetshop(params:{ pno:number, count:number}) {
        let url = BMDURL + '/petshop/getallpetshop'
        return myaxios.get(url,params)
    },
    /**
     * 模糊查询商品
     * @param {object} params {keyword:string}
     * @returns 
     */
    queryListByName(params:{keyword:string}) {
        let url = BMDURL + '/petshop/queryListByName'
        return myaxios.get(url,params)
    },
     /**
     * 根据宠物店id模糊查询商品
     * @param {object} params {petshop_id:number,keyword:string}
     * @returns 
     */
      queryListByNameId(params:{petshop_id:number,keyword:string}) {
        let url = BMDURL + '/petshop//queryListById'
        return myaxios.get(url,params)
    },
    /**
     * 新增寄养
     * @param {object} params {petshop_id:number,daylong:string,total:string,user_id:number}
     * @returns 
     */
    addFosterage(params:{petshop_id:number,daylong:string,total:string,user_id:number}) {
        let url = BMDURL + '/petshop/addfosterage'
        return myaxios.post(url,params)
    },
    /**
     * 根据宠物店id查询寄养信息
     * @param {object} params {petshop_id:number}
     * @returns 
     */
    listFosterageByPetshopId(params:{petshop_id:number}) {
        let url = BMDURL + '/petshop/getfosteragebypetshopid'
        return myaxios.get(url,params)
    },
    /**
     * 根据用户id查询寄养信息
     * @param {object} params {user_id:number}
     * @returns 
     */
    listFosterageByUserId(params:{user_id:number}) {
        let url = BMDURL + '/petshop/getfosteragebyuserid'
        return myaxios.get(url,params)
    },
    /**
     * 新增预约照相
     * @param {object} params {petshop_id:number,user_id:number,pic_time:number}
     * @returns 
     */
    addTakepic(params:{petshop_id:number,user_id:number,pic_time:number}) {
        let url = BMDURL + '/petshop/addtakepic'
        return myaxios.post(url,params)
    },
    /**
     * 根据宠物店id查询照相信息
     * @param {object} params {petshop_id:number}
     * @returns 
     */
    getPicbyPetshopId(params:{petshop_id:number}) {
        let url = BMDURL + '/petshop/getpicbypetshopid'
        return myaxios.get(url,params)
    },
    /**
     * 根据用户id查询寄养信息
     * @param {object} params {user_id:number}
     * @returns 
     */
    getPicByUserId(params:{user_id:number}) {
        let url = BMDURL + '/petshop/getpicbyuserid'
        return myaxios.get(url,params)
    },


    /**
     * 根据商品id查询商品信息
     * @param {object} params {commondity_id:number}
     * @returns 
     */
     queryCommondityById(params:{commondity_id:number}) {
        let url = BMDURL + '/petshop/querycommonditybyid'
        return myaxios.get(url,params)
    },
    /**
     *  宠物店根据预约宠物店id查询预约
     * @parsma {object} params{petshop_id:number,pno:number,count:number}
     * @return
     */
    getWashByPetshopId(params:{petshop_id:number,pno:number,count:number}){
        let url = BMDURL + '/petshop/getwashByPetshopId'
        return myaxios.get(url,params)
    },

    /**
     *  宠物店修改拍照预约状态
     * @parsma {object} params{pic_id:number}
     * @return
     */
     updatePicState(params:{pic_id:number}){
        let url = BMDURL + '/petshop/updatepicstate'
        return myaxios.post(url,params)
    },
      /**
     *  宠物店修改寄养状态
     * @parsma {object} params{fosterage_id:number}
     * @return
     */
       updateFosterageState(params:{fosterage_id:number}){
        let url = BMDURL + '/petshop/updatefosterage'
        return myaxios.post(url,params)
    },
    /**
     * 查询所有通过审核的商品
     * @parsma {object} params{page:number,pagesize:number}
     * @return
     */
     queryAllCommonditySu(params:{page:number,pagesize:number}){
        let url = BMDURL + '/petshop/listshopSuccess'
        return myaxios.get(url,params)
    },
     /**
     * 查询未通过审核的商品
     * @parsma {object} params{page:number,pagesize:number}
     * @return
     */
      queryAllCommondityUn(params:{page:number,pagesize:number}){
        let url = BMDURL + '/petshop/listshopUn'
        return myaxios.get(url,params)
    }



}
export default petshopApi