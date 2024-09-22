<template>
    <div>
        <app-head></app-head>
        <app-body>
          <div style="height: 66vh;margin-bottom: 20px;background-color: #f6f6f6;box-sizing: border-box;padding-bottom: 10px">
            <div style="width: 100%;height: 100%;">
              <el-carousel autoplay initial-index="2" :interval="3000" height="65vh" arrow="always">
                <el-carousel-item v-for="item in imageList" :key="item">
                  <el-image @click="goPush(item.url)" :src="item.value" style="width: 100%;height: 100%;" :fit="'fill'" />
                </el-carousel-item>
              </el-carousel>
            </div>
          </div>
            <div style="min-height: 85vh;">
            <el-tabs v-model="labelName" type="card" @tab-click="handleClick">
                <el-tab-pane label="全部" name="0"></el-tab-pane>
                <el-tab-pane label="数码" name="1"></el-tab-pane>
                <el-tab-pane label="家电" name="2"></el-tab-pane>
                <el-tab-pane label="户外" name="3"></el-tab-pane>
                <el-tab-pane label="图书" name="4"></el-tab-pane>
                <el-tab-pane label="其他" name="5"></el-tab-pane>
            </el-tabs>

            <div style="margin: 0 20px;">
                <el-row :gutter="30">
                    <el-col :span="6" v-for="(idle,index) in idleList">
                        <div class="idle-card" @click="toDetails(idle)">
                            <el-image
                                    style="width: 100%; height: 160px"
                                    :src="idle.imgUrl"
                                    fit="contain">
                                <div slot="error" class="image-slot">
                                    <i class="el-icon-picture-outline">无图</i>
                                </div>
                            </el-image>
                            <div class="idle-title">
                                {{idle.idleName}}
                            </div>
                            <el-row style="margin: 5px 10px;">
                                <el-col :span="12">
                                    <div class="idle-prive">￥{{idle.idlePrice}}</div>
                                </el-col>
                                <el-col :span="12">
                                    <div class="idle-place">{{idle.idlePlace}}</div>
                                </el-col>
                            </el-row>
                           <!-- <div class="idle-time">{{idle.timeStr}}</div>-->
                            <div class="user-info">
                                <el-image
                                        style="width: 30px; height: 30px"
                                        :src="idle.user.avatar"
                                        fit="contain">
                                    <div slot="error" class="image-slot">
                                        <i class="el-icon-picture-outline">无图</i>
                                    </div>
                                </el-image>
                                <div class="user-nickname">{{idle.user.nickname}}</div>
                            </div>
                        </div>
                    </el-col>
                </el-row>
            </div>
            <div class="fenye">
                <el-pagination
                        background
                        @current-change="handleCurrentChange"
                        :current-page.sync="currentPage"
                        :page-size="8"
                        layout="prev, pager, next, jumper"
                        :total="totalItem">
                </el-pagination>
            </div>
            </div>
            <app-foot></app-foot>
        </app-body>
    </div>
</template>

<script>
    import AppHead from '../common/AppHeader.vue';
    import AppBody from '../common/AppPageBody.vue'
    import AppFoot from '../common/AppFoot.vue'

    export default {
        name: "index",
        components: {
            AppHead,
            AppBody,
            AppFoot
        },
        data() {
          return {
            labelName: '0',
            idleList: [],
            currentPage: 1,
            totalItem: 1,
            imageList: [
              {
                value: 'https://img.picui.cn/free/2024/09/20/66ed23a56f08c.png',
                url:'https://picui.cn/'
              }
            ]
          };
        },
        created() {
          this.findIdleTiem(1)
          this.getIndexCaouesl()
        },
        watch:{
            $route(to,from){
                this.labelName=to.query.labelName;
                let val=parseInt(to.query.page)?parseInt(to.query.page):1;
                this.currentPage=parseInt(to.query.page)?parseInt(to.query.page):1;
                this.findIdleTiem(val);
            }
        },
        methods: {
          goPush(e){
            window.open(e, '_blank');
          },
          getIndexCaouesl(){
            this.$api.getLoginCaouesl().then(res => {
              if (res.data.status_code === 1){
                res.data.data.forEach(item => {
                  if (item.type == 2){
                    this.imageList.unshift(item)
                  }
                })
              }
            })
          },
            findIdleTiem(page){
                const loading = this.$loading({
                    lock: true,
                    text: '加载数据中',
                    spinner: 'el-icon-loading',
                    background: 'rgba(0, 0, 0, 0)'
                });
                if(this.labelName>0){
                    this.$api.findIdleTiemByLable({
                        idleLabel:this.labelName,
                        page: page,
                        nums: 8
                    }).then(res => {
                        console.log(res);
                        let list = res.data.data.list;
                        for (let i = 0; i < list.length; i++) {
                            list[i].timeStr = list[i].releaseTime.substring(0, 10) + " " + list[i].releaseTime.substring(11, 19);
                            let pictureList = JSON.parse(list[i].pictureList);
                            list[i].imgUrl = pictureList.length > 0 ? pictureList[0] : '';
                        }
                        this.idleList = list;
                        this.totalItem=res.data.data.count;
                        console.log(this.totalItem);
                    }).catch(e => {
                        console.log(e)
                    }).finally(()=>{
                        loading.close();
                    })
                }else{
                    this.$api.findIdleTiem({
                        page: page,
                        nums: 8
                    }).then(res => {
                        console.log(res);
                        let list = res.data.data.list;
                        for (let i = 0; i < list.length; i++) {
                            list[i].timeStr = list[i].releaseTime.substring(0, 10) + " " + list[i].releaseTime.substring(11, 19);
                            let pictureList = JSON.parse(list[i].pictureList);
                            list[i].imgUrl = pictureList.length > 0 ? pictureList[0] : '';
                        }
                        this.idleList = list;
                        this.totalItem=res.data.data.count;
                        console.log(this.totalItem);
                    }).catch(e => {
                        console.log(e)
                    }).finally(()=>{
                        loading.close();
                    })
                }
            },
            handleClick(tab, event) {
                // console.log(tab,event);
                console.log(this.labelName);
                this.$router.replace({query: {page: 1,labelName:this.labelName}});
            },
            handleCurrentChange(val) {
                console.log(`当前页: ${val}`);
                this.$router.replace({query: {page: val,labelName:this.labelName}});
            },
            toDetails(idle) {
                this.$router.push({path: '/details', query: {id: idle.id}});
            }
        }
    }
</script>

<style scoped>
.idle-card {
  height: 300px;
  border: #eeeeee solid 1px;
  margin-bottom: 15px;
  cursor: pointer;
  border-radius: 15px;
}

.fenye {
  display: flex;
  justify-content: center;
  height: 60px;
  align-items: center;
}

.idle-title {
  font-size: 18px;
  font-weight: 600;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  margin: 10px;
}

.idle-prive {
  font-size: 16px;
  color: red;
}

.idle-place {
  font-size: 13px;
  color: #666666;
  float: right;
  padding-right: 20px;

}

.idle-time {
  color: #666666;
  font-size: 12px;
  margin: 0 10px;
}

.user-nickname {
  color: #999999;
  font-size: 12px;
  display: flex;
  align-items: center;
  height: 30px;
  padding-left: 10px;
}

.user-info {
  margin-top: 10px;
  float: right;
  padding: 5px 10px;
  height: 30px;
  display: flex;
}
</style>