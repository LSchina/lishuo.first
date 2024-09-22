<template>
  <div class="main-border">
    <el-menu default-active="1" class="el-menu-demo" mode="horizontal" @select="handleSelect">
      <el-menu-item index="1">登录页面轮播图</el-menu-item>
      <el-menu-item index="2">前台页面轮播图</el-menu-item>
    </el-menu>
    <el-dialog
        title="修改广告"
        :visible.sync="adminRegVisible"
        width="25%"
    >
      <span style="margin-left: 10px">广告URL</span>
      <el-input v-model="carousel.url"   placeholder="请输入URL" style="padding: 10px 0" clearable required></el-input>
      <div class="release-idle-container-picture-title">上传广告照片</div>
      <el-upload
          action="http://localhost:8081/file/"
          :on-preview="fileHandlePreview"
          :on-remove="fileHandleRemove"
          :on-success="fileHandleSuccess"
          :show-file-list="showFileList"
          :limit="10"
          accept="image/*"
          drag
          multiple>
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将图片拖到此处，或<em>点击上传</em></div>
      </el-upload>
      <span slot="footer" class="dialog-footer">
                        <el-button type="primary" @click="submit()">提交</el-button>
                    </span>
    </el-dialog>

    <el-table v-show="this.mode == 1"
              :data="loginData"
              stripe
              style="width: 100%;color: #5a5c61;">
      <el-table-column
          type="index"
          label="编号"
          show-overflow-tooltip
          min-width="150"
          width="100">
      </el-table-column>
      <el-table-column label="图片" width="100">
        <template slot-scope="scope">
          <el-avatar shape="square" :size="23" :src="scope.row.value"></el-avatar>
        </template>
      </el-table-column>
      <el-table-column
          prop="url"
          label="网站"
          show-overflow-tooltip
          width="200">
      </el-table-column>
      <el-table-column
          prop="createTime"
          label="创建时间"
          show-overflow-tooltip
          width="200">
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="success"
              @click="updateCarousel(scope.$index)">修改</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-table v-show="this.mode == 2"
              :data="indexData"
              stripe
              style="width: 100%;">
      <el-table-column
          type="index"
          label="编号"
          show-overflow-tooltip
          min-width="150"
          width="100">
      </el-table-column>
      <el-table-column label="图片" width="100">
        <template slot-scope="scope">
          <el-avatar shape="square" :size="23" :src="scope.row.value"></el-avatar>
        </template>
      </el-table-column>
      <el-table-column
          prop="url"
          label="网站"
          show-overflow-tooltip
          width="200">
      </el-table-column>
      <el-table-column
          prop="createTime"
          label="创建时间"
          show-overflow-tooltip
          width="200">
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="success"
              @click="updateCarousel(scope.row.id)">修改</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  name: "CarouselList",
  created() {
    this.getCarouselLoginData();
  },
  methods: {
    handleCurrentChange(val) {
      this.nowPage = val;
      if(this.mode == 1){
        this.getCarouselLoginData();
      }
      if(this.mode == 2){
        this.getCarouselIndexData();
      }
    },
    handleSelect(val){
      if(this.mode !== val){
        this.mode = val
        if(val == 1){
          this.nowPage = 1;
          this.getCarouselLoginData();
        }
        if(val == 2){
          this.nowPage = 1;
          this.getCarouselIndexData();
        }
      }
    },
    getCarouselLoginData(){
      this.$api.getCarouselList().then(res => {
        if(res.data.status_code==1){
          console.log(res.data)
          this.loginData = res.data.data;
          console.log(res.data.data)
        }else {
          this.$message.error(res.data.msg)
        }
      }).catch(e => {
        console.log(e)
      })
    },
    getCarouselIndexData(){
      this.$api.getCarouselIndexList().then(res => {
        if(res.data.status_code==1){
          console.log(res)
          this.indexData = res.data.data;
        }else {
          this.$message.error(res.data.msg)
        }
      }).catch(e => {
        console.log(e)
      });
    },
    updateCarousel(id){
      this.adminRegVisible = true;
      this.carouselIdList.push(id)
    },

    fileHandleRemove(file, fileList) {
      console.log(file, fileList);
      for(let i=0;i<this.imgList.length;i++){
        if(this.imgList[i]===file.response.data){
          this.imgList.splice(i,1);
        }
      }
    },
    fileHandlePreview(file) {
      console.log(file);
      this.dialogImageUrl=file.response.data;
      this.imgDialogVisible=true;
    },
    fileHandleSuccess(response, file, fileList){
      console.log("file:",response,file,fileList);
      this.imgList.push(response.data);
    },
    submit(){
      this.carousel.id = this.carouselIdList[this.carouselIdList.length-1] + 1;
      console.log(this.carousel.id)
      this.carousel.value = JSON.stringify(this.imgList[0]);
      console.log(this.carousel)
      this.$api.updateCarousel(
          this.carousel
      ).then(res => {
        if (res.data.status_code === 1){
          this.$message({
            message: '修改成功！',
            type: 'success'
          });
          this.imgList = [];
          this.carouselIdList = [];
          this.adminRegVisible = false;
          this.getCarouselLoginData();
        }else {
          this.$message.error('修改失败！'+res.data.msg);
        }
        })
      },
  },
  data(){
    return {
      mode:1,
      adminRegVisible: false,
      carousel:{
        url:'',
        value:'',
        id:''
      },
      loginData: [],
      indexData:[],
      imgList:[],
      showFileList:[],
      carouselIdList:[]
    }
  },
}
</script>

<style scoped>
.main-border{
  background-color: #FFF;
  padding: 10px 30px;
  box-shadow: 0 1px 15px -6px rgba(0,0,0,.5);
  border-radius: 5px;
}
.block {
  display: flex;
  justify-content:center;
  padding-top: 15px;
  padding-bottom: 10px;
  width: 100%;
}
.addAdminButton{
  display:flex;
  justify-content: flex-end;
  align-items: center;
  height: 60px;
  outline: none;
}
</style>