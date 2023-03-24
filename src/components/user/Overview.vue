<template>
  <el-row class="table-row">
    <el-col class="label" :span="3"> 昵称: </el-col>
    <el-col class="content" :span="18"> uyg </el-col>
    <el-col class="operation" :span="3"> </el-col>
  </el-row>
  <el-row class="table-row">
    <el-col class="label" :span="3">认证: </el-col>
    <el-col class="content" :span="18">未认证 </el-col>
    <el-col class="operation" :span="3">前往认证 </el-col>
  </el-row>
  <el-row class="table-row">
    <el-col class="label" :span="3">描述: </el-col>
    <el-col class="content" :span="18"
      >本站第254号会员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;入驻本站0天
    </el-col>
    <el-col class="operation" :span="3"></el-col>
  </el-row>
  <el-row class="table-row">
    <el-col class="label" :span="3">性别: </el-col>
    <el-col class="content" :span="18"> 男 </el-col>
    <el-col class="operation" :span="3"></el-col>
  </el-row>
  <el-row class="table-row">
    <el-col class="label" :span="3">网址: </el-col>
    <el-col class="content" :span="18">没有网址 </el-col>
    <el-col
      class="operation"
      :span="3"
      @click="$router.push({ name: 'setting' })"
      >前往设置</el-col
    >
  </el-row>
  <el-row class="table-row">
    <el-col class="label" :span="3">简介: </el-col>
    <el-col class="content" :span="18">没有描述 </el-col>
    <el-col
      class="operation"
      :span="3"
      @click="$router.push({ name: 'setting' })"
      >前往设置</el-col
    >
  </el-row>
  <el-row style="margin-top: 30px; font-size: 25px">财富</el-row>
  <div style="padding-left: 20px; margin-top: 20px">
    <el-row style="margin-top: 30px">
      <el-col :span="11" style="font-size: 25px"> B0 </el-col>
      <el-col :span="12" style="font-size: 25px"> 5 </el-col>
    </el-row>
    <el-row style="margin-top: 80px">
      <el-col :span="6" class="info-item">
        <div class="info">发布的文章</div>
        <div class="count">0</div>
        <div class="desc">在本站的投稿</div>
      </el-col>
      <el-col :span="6" class="info-item">
        <div class="info">提交的评论</div>
        <div class="count">0</div>
        <div class="desc">在本站提交的评论</div>
      </el-col>
      <el-col :span="6" class="info-item">
        <div class="info">关注</div>
        <div class="count">0</div>
        <div class="desc">关注的人数</div>
      </el-col>
      <el-col :span="6" class="info-item">
        <div class="info">粉丝</div>
        <div class="count">0</div>
        <div class="desc">粉丝人数</div>
      </el-col>
    </el-row>
    <el-row style="margin-top: 50px">
      <el-col :span="6" class="info-item">
        <div class="info">收藏的文章</div>
        <div class="count">0</div>
        <div class="desc">收藏的文章数量</div>
      </el-col>
    </el-row>
  </div>
</template>

<style scoped lang="scss">
.table-row {
  &:not(:first-child) {
    margin-top: 30px;
  }
  .label {
    color: gray;
  }
  .operation {
    color: orange;
    font-size: 13px;
    cursor: pointer;
  }
}
.info-item {
  .info {
    font-size: 15px;
  }
  .count {
    margin-top: 17px;
    font-size: 16px;
    font-weight: bold;
  }
  .desc {
    margin-top: 15px;
    font-size: 13px;
    color: gray;
  }
}
</style>
