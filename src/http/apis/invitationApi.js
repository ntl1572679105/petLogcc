import BaseUrl from "@/http/BaseUrl";
import myaxios from "@/http/MyAxios";
const BMDURL = BaseUrl.BMDURL
const invitationApi = {
    /**
     * 用户发布信息
     * @param {object} params {invitation_title:string,invitation_content:string,invitation_time:number,user_id:number} 
     */
    addInvite(params){
        let url = BMDURL + '/community/addInvite'
        return myaxios.post(url,params)
    },
    /**
     * 用户根据id查询关于该用户发布的信息
     * @param {object} params {user_id:number,page:number,pagesize:number}
     */
    listById(params){
        let url = '/community/list/id'
        return myaxios.get(url,params)
    },
    /**
     * 查询所有的信息
     * @param {object} params {page:number,pagesize:number}
     */
    list(params){
        let url = BMDURL + '/community/list'
        return myaxios.get(url,params)
    },
    /**
     * 修改信息状态
     * @param {object} params {invitation_state:number,invitation_id:number}
     */
    state(params){
        let url =BMDURL + '/community/state'
        return myaxios.post(url,params)
    },
    /**
     * 修改信息
     * @param {object} params {invitation_title:string,invitation_content:string,invitation_time:number,invitation_id:number}
     */
    update(params){
        let url =BMDURL + '/community/update'
        return myaxios.post(url,params)
    },
    /**
     * 删除信息
     * @param {object} params {invitation_id:number}
     */
    del(params){
        let url =BMDURL + '/community/del'
        return myaxios.post(url,params)
    },
    /**
     * 发表评论
     * @param {object} params {commenton_content:string,invitation_id:number,user_id:number,parent_id:number}
     */
    addCommenton(params){
        let url =BMDURL + '/community/add/commenton'
        return myaxios.post(url,params)
    },
    /**
     * 通过用户id查询该用户的评论
     * @param {object} params {user_id:number}
     */
    listCommentonByUserId(params) {
        let url =BMDURL + '/list/commenton/user'
        return myaxios.get(url,params)
    },
    /**
     * 通过信息id查询该信息的评论
     * @param {object} params {invitation_id:number}
     * @returns 
     */
    listCommentonById(params) {
        let url =BMDURL + '/list/commenton/888'
        return myaxios.get(url,params)
    }

}


export default invitationApi