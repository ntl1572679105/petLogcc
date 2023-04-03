/** 该文件仅存放演员模块相关的接口API */
import myaxios from "../MyAxios";
// 引入路径前缀
import BASEURL from '../BaseUrl'
const { BMDURL } = BASEURL

const searchApi = {
    /**
     * 查询所有帖子
     * @param params {user_id=1&page=1&pagesize=2}
     */
    queryByCategoryId(
        params: { user_id: number, page: number, pagesize: number }) {
        let url = BMDURL + '/community/list/id'
        return myaxios.get(url, params)
    }
}

export default searchApi;