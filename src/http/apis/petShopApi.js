import axios from "axios";
import qs from 'qs'
import BaseUrl from "@/http/BaseUrl";
import myaxios from "../myAxios";
const BMDURL = BaseUrl.BMDURL
const petshopApi = {
    /**
     * 宠物店新增商品
     * @param {object} params {commondity_name} 
     */
    addShop(params) {
        let url = BMDURL + '/petshop/addcommodity'
        return myaxios.post(url, params)
    },
    /**
     * 宠物店修改商品状态
     * @param {object} params {state:string,commondity_id:number}
     * @returns 
     */
    updateShopState(params) {
        let url = BMDURL + '/petshop/updatestate'
        return myaxios.post(url, params)
    },
    /**
     * 宠物店查询商品
     * @param {object} params {petshop_id:number}
     * @returns 
     */
    listShop(params) {
        let url = BMDURL + '/petshop/getcommondity'
        return myaxios.get(url, params)
    },
    /**
     * 宠物店修改商品
     * @param {object} params {commondity_name:string, commondity_description:string, commondity_img:string, commondity_price:string, commondity_idnumber}
     * @returns 
     */
    uodateShop(params) {
        let url = BMDURL + '/petshop/updatecommondity'
        return myaxios.post(url, params)
    },
    /**
     * 宠物店删除商品
     * @param {object} params {commondity_id:number}
     * @returns 
     */
    delShop(params) {
        let url = BMDURL + '/petshop/deletecommondity'
        return myaxios.post(url, params)
    },
    /**
     * 用户预约洗护
     * @param {object} params {type_id:number, wash_time:number, user_id:number, petshop_id:number}
     * @returns 
     */
    addWash(params) {
        let url = BMDURL + '/petshop/addwash'
        return myaxios.post(url, params)
    },
    /**
     * 宠物店修改预约状态
     * @param {object} params {wash_id :number}
     * @returns 
     */
    updateWashState(params) {
        let url = BMDURL + '/petshop/updatewashstate'
        return myaxios.post(url, params)
    },
    /**
     * 用户跟读预约的用户id显示预约信息
     * @param {object} params {user_id:number, pno:number, count:number}
     * @returns 
     */
    listWashByUserId(params) {
        let url = BMDURL + '/petshop/getwashByUserId'
        return myaxios.get(url, params)
    },
    /**
     * 宠物店根据预约宠物店id显示预约
     * @param {object} params {type_name:string, price:number, petshop_id:number}
     * @returns 
     */
    addWashType(params) {
        let url = BMDURL + '/petshop/addwashType'
        return myaxios.post(url, params)
    },
    /**
     * 查询所有宠物店
     * @param {object} params { pno:number, count:number}
     * @returns 
     */
    listAllPetshop(params) {
        let url = BMDURL + '/petshop/getallpetshop'
        return myaxios.get(url, params)
    },
    /**
     * 模糊查询商品
     * @param {object} params {keyword:string}
     * @returns 
     */
    queryListByName(params) {
        let url = BMDURL + '/petshop/queryListByName'
        return myaxios.get(url, params)
    },
    /**
     * 新增寄养
     * @param {object} params {petshop_id:number,daylong:string,total:string,user_id:number}
     * @returns 
     */
    addFosterage(params) {
        let url = BMDURL + '/petshop/addfosterage'
        return myaxios.post(url, params)
    },
    /**
     * 根据宠物店id查询寄养信息
     * @param {object} params {petshop_id:number}
     * @returns 
     */
    listFosterageByPetshopId(params) {
        let url = BMDURL + '/petshop/getfosteragebypetshopid'
        return myaxios.get(url, params)
    },
    /**
     * 根据用户id查询寄养信息
     * @param {object} params {user_id:number}
     * @returns 
     */
    listWashByUserId(params) {
        let url = BMDURL + '/petshop/getfosteragebyuserid'
        return myaxios.get(url, params)
    },
    /**
     * 新增预约照相
     * @param {object} params {petshop_id:number,user_id:number,pic_time:number}
     * @returns 
     */
    addTakepic(params) {
        let url = BMDURL + '/petshop/addtakepic'
        return myaxios.post(url, params)
    },
    /**
     * 根据宠物店id查询照相信息
     * @param {object} params {petshop_id:number}
     * @returns 
     */
    getPicbyPetshopId(params) {
        let url = BMDURL + '/petshop/getpicbypetshopid'
        return myaxios.get(url, params)
    },
    /**
     * 根据用户id查询寄养信息
     * @param {object} params {user_id:number}
     * @returns 
     */
    getPicByUserId(params) {
        let url = BMDURL + '/petshop/getpicbyuserid'
        return myaxios.get(url, params)
    },
    /**
    * 查询所有商品
    * @param {object} params {user_id:number}
    * @returns 
    */
    getAllCommondity(params) {
        let url = BMDURL + '/petshop/listshop'
        return myaxios.get(url, params)
    }

}
export default petshopApi