import BaseUrl from "@/http/BaseUrl";
const BMDURL = BaseUrl.BMDURL
const userApi = {
  /**
   * 管理员登录
   * @param {object} params {admin_phone:number,admin_pwd:string}
   * @returns 
   */
  loginByAdmin(params) {
    return myaxios.post(BMDURL + "/user/admin/login", params);
  },
  /**
   * 用户注册
   * @param {object} params {user_name:string,user_phone:number,user_pwd:string,user_email:string}
   * @returns 
   */
  registerByUser(params) {
    return myaxios.post(BMDURL + "/user/register", params);
  },
  /**
 * 用户登录
 * @param {object} params {user_phone:number,user_pwd:string}
 * @returns 
 */
  loginByUser(params) {
    return myaxios.post(BMDURL + "/user/login", params);
  },
  /**
   * 检验手机号是否注册
   * @param {object} params {user_phone:number} 
   * @returns 
   */
  queryPhone(params) {
    return myaxios.post(BMDURL + "/user/query/phone", params);
  },
  /**
   * 添加宠物店
   * @param {object} params {petshop_name:string,petshop_address:string,petshop_phone:number}
   * @returns 
   */
  petshopAdd(params) {
    return myaxios.post(BMDURL + "/user/petshop/add", params);
  },
  /**
    * 用户修改
    * @param {object} params {user_name:string,user_phone:number,user_pwd:string,user_email:string,user_avatar:string,user_id:number}
    * @returns 
    */
  updateByUser(params) {
    return myaxios.post(BMDURL + "/user/update", params);
  },
}
export default userApi