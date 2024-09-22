<template>
    <div style="background-color: #f6f6f6;min-height:100vh;letter-spacing: 1px">
        <el-container>
            <el-header>
                <div class="header">
                    <div class="app-name">
                        <router-link to="/platform-admin" >后台管理</router-link>
                    </div>
                  <span class="app-title"><div style="background-color: #409EFF;padding: 4px;font-size: 13px;border-radius: 5px;border: #1c84ef 3px solid">{{admin.nickname}}</div></span>
                    <div  class="app-logOut">
                        <el-button style="margin-right: 100px" type="primary" @click="logout">退出登录</el-button>
                    </div>
                </div>
            </el-header>
            <el-container>
                <div class="mainBody" background-color="#3a8ee6">
                    <el-aside >
                        <el-col :span="24" >
                            <el-menu
                                    default-active="0"
                                    class="el-menu-vertical-demo"
                                    @select="handleSelect"
                                    background-color="#3a8ee6"
                                    text-color="#fff"
                                    style="height: 90vh;letter-spacing: 2px"
                                    active-text-color="#fff">
                                <el-menu-item index="0">
                                    <i class="el-icon-s-home"></i>
                                    <span>首页</span>
                                </el-menu-item>
                              <el-menu-item index="1">
                                    <i class="el-icon-goods"></i>
                                    <span>商品管理</span>
                                </el-menu-item>
                                <el-menu-item index="2">
                                    <i class="el-icon-s-goods"></i>
                                    <span slot="title">订单管理</span>
                                </el-menu-item>
                                <el-menu-item index="3" >
                                    <i class="el-icon-s-custom"></i>
                                    <span slot="title">用户管理</span>
                                </el-menu-item>
                              <el-menu-item index="4" >
                                    <i class="el-icon-chat-dot-round"></i>
                                    <span slot="title">消息管理</span>
                                </el-menu-item>
                              <el-menu-item index="5" >
                                    <i class="el-icon-menu"></i>
                                    <span slot="title">广告管理</span>
                                </el-menu-item>
                            </el-menu>
                        </el-col>
                    </el-aside>
                    <el-main>
                        <IdleGoods v-if="mode == 1"></IdleGoods>
                        <orderList v-if="mode == 2"></orderList>
                        <userList v-if="mode == 3"></userList>
                        <back-home v-if="mode == 0"></back-home>
                        <message-list v-if="mode == 4"></message-list>
                        <CarouselList v-if="mode == 5"></CarouselList>
                    </el-main>
                </div>
            </el-container>
        </el-container>
        <div class="foot">
            <app-foot></app-foot>
        </div>
    </div>
</template>

<script>
    import AppFoot from '../common/AppFoot.vue'
    import IdleGoods from '../common/IdleGoods.vue'
    import orderList from '../common/orderList.vue'
    import userList from '../common/userList.vue'
    import backHome from "@/components/common/backHome";
    import messageList from "@/components/common/messageList";
    import CarouselList from "@/components/common/CarouselList";
    export default {
        name: "platform-admin",
        components: {
          AppFoot,
          IdleGoods,
          orderList,
          userList,
          backHome,
          messageList,
          CarouselList
        },
        data(){
            return {
                mode: 0,
                admin:{
                    nickname:'管理员',
                },
            }
        },
        created() {
            this.admin.nickname=this.$sta.adminName;
        },
        methods: {
            logout(){
                this.$api.loginOut({
                }).then(res => {
                    if(res.data.status_code === 1){
                        this.$sta.isLogin=false;
                        this.$sta.adminName='';
                        this.$router.push({path:'/login-admin'});
                    }
                }).catch(e => {
                    console.log(e)
                })
            },
            handleSelect(val){
                if(this.mode !== val){
                    this.mode = val
                }
            },
        },
    }
</script>

<style scoped>
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  min-width: 100vw;
  height: 58px;
  background: #ffffff;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: #eeeeee solid 2px;
  z-index: 1000;
}

.app-name {
  display: flex;
  justify-content: center;
  align-items: center;
  min-width: 10vw;
  flex: 1;
  height: 100%;
  border-right: 1px solid #e5e5e5;
  background-color: #3a8ee6;

}

.app-name a {
  color: #FFFFFF;
  font-size: 18px;
  font-weight: 800;
  text-decoration: none;
  padding: 0 20px;
}

.app-title {
  display: flex;
  justify-content: center;
  flex: 8;
  margin-left: 1000px;
}

.app-logOut {
  display: flex;
  flex: 1;
  justify-content: flex-end;
  align-items: center;
}

.mainBody {
  display: flex;
  width: 100%;
}

aside {
  flex: 1;
  box-sizing: content-box;
  min-width: 10vw;
  min-height: calc(100vh - 120px);
  background-color: rgb(255, 255, 255);
  border-bottom: 1px solid #e5e5e5;
  border-right: 1px solid #e5e5e5;

}

main {
  flex: 9;
}

.foot {
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 58px;
  background-color: #ffffff;
}
</style>