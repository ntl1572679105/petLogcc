import BaseUrl from "@/http/BaseUrl";
import myaxios from "@/http/MyAxios";
const BMDURL = BaseUrl.BMDURL
const invitationApi = {
    /**
     * 用户发布信息
     * @param {object} params {invitation_title:string,invitation_content:string,invitation_time:number,user_id:number} 
     */
    addInvite(params:{invitation_title:string,invitation_content:string,invitation_time:number,user_id:number}){
        let url = BMDURL + '/community/addInvite'
        return myaxios.get(url,params)
    },
    /**
     * 用户根据id查询关于该用户发布的信息
     * @param {object} params {user_id:number,page:number,pagesize:number}
     */
    listById(params:{user_id:number,page:number,pagesize:number}){
        let url = '/community/list/id'
        return myaxios.get(url,params)
    },
    /**
     * 查询所有的信息
     * @param {object} params {page:number,pagesize:number}
     */
    list(params:{page:number,pagesize:number}){
        let url = BMDURL + '/community/list'
        return myaxios.get(url,params)
    },
    /**
     * 修改信息状态
     * @param {object} params {invitation_state:number,invitation_id:number}
     */
    state(params:{invitation_state:number,invitation_id:number}){
        let url =BMDURL + '/community/state'
        return myaxios.post(url,params)
    },
    /**
     * 修改信息
     * @param {object} params {invitation_title:string,invitation_content:string,invitation_time:number,invitation_id:number}
     */
    update(params:{invitation_title:string,invitation_content:string,invitation_time:number,invitation_id:number}){
        let url =BMDURL + '/community/update'
        return myaxios.post(url,params)
    },
    /**
     * 删除信息
     * @param {object} params {invitation_id:number}
     */
    del(params:{invitation_id:number}){
        let url =BMDURL + '/community/del'
        return myaxios.post(url,params)
    },
    /**
     * 发表评论
     * @param {object} params {commenton_content:string,invitation_id:number,user_id:number}
     */
    addCommenton(params:{commenton_content:string,invitation_id:number,user_id:number}){
        let url =BMDURL + '/community/add/commenton'
        return myaxios.post(url,params)
    },
    /**
     * 通过用户id查询该用户的评论
     * @param {object} params {user_id:number}
     */
    listCommentonByUserId(params:{user_id:number}) {
        let url =BMDURL + '/list/commenton/user'
        return myaxios.get(url,params)
    },
    /**
     * 通过信息id查询该信息的评论
     * @param {object} params {invitation_id:number}
     * @returns 
     */
    listCommentonById(params:{invitation_id:number}) {
        let url =BMDURL + '/community/list/commenton/888'
        return myaxios.get(url,params)
    },
    /**
     * 通过信息id查询该信息详情
     * @param {object} params {invitation_id:number}
     * @returns 
     */
    listCommentonByinvitationId(params:{invitation_id:number}) {
        let url =BMDURL + '/community/list/commenton/invitation_id'
        return myaxios.get(url,params)
    },
}


export default invitationApi