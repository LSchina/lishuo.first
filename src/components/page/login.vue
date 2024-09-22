<template>
    <div class="login-container" >
        <div style="display: flex;justify-content: center;border-radius: 10px;width: 70%;height: 80vh;margin-top: 150px;">
          <div style="width: 600px;height: 60vh;background-color: #666666;border-top-left-radius: 10px;border-bottom-left-radius: 10px;">
            <el-carousel :interval="5000" height="60vh" arrow="always">
              <el-carousel-item v-for="item in imageList" :key="item">
                <el-image :src="item.value" style="width: 100%;height: 100%;;border-top-left-radius: 10px;border-bottom-left-radius: 10px;" :fit="'fill'" />
              </el-carousel-item>
            </el-carousel>
          </div>
          <div class="login-body">
            <div  style="margin-top: 60px"  class="login-title" @click="toIndex">二手交易平台</div>
            <el-form ref="form" :model="userForm">
              <el-input  style="margin-top: 15px"  placeholder="请输入账号..." v-model="userForm.accountNumber" class="login-input">
                <template slot="prepend">
                  <div class="el-icon-user-solid"></div>
                </template>
              </el-input>
              <el-input  placeholder="请输入密码..." v-model="userForm.userPassword" class="login-input"
                        @keyup.enter.native="login" show-password>
                <template slot="prepend">
                  <div class="el-icon-lock"></div>
                </template>
              </el-input>
              <div  style="margin-top: 15px" class="login-submit">
                <el-button type="primary" @click="login">登录</el-button>
                <el-button type="warning" autocomplete="off" @click="$router.push('/sign-in')"
                           style="margin-left: 20px">注册
                </el-button>
              </div>
              <div  class="other-submit">
                <router-link to="/login-admin" class="sign-in-text">管理员登录</router-link>
              </div>
            </el-form>
          </div>
        </div>
    </div>
</template>

<script>
import Cookies from 'js-cookie';
    export default {
      name: "login",
      created() {
        this.getLoginCaouesl();
      },
      data() {
            return {
                userForm: {
                    accountNumber: '',
                    userPassword: ''
                },
              imageList: []
            };
        },

        methods: {
          getLoginCaouesl() {
            this.$api.getLoginCaouesl().then(res => {
              if (res.data.status_code === 1) {
                res.data.data.forEach(item => {
                  if (item.type === 1) {
                    this.imageList.push(item)
                  }
                })
              }
            })
          },
            login() {
                this.$api.userLogin({
                    accountNumber: this.userForm.accountNumber,
                    userPassword: this.userForm.userPassword
                }).then(res => {
                    console.log(res);
                    if (res.data.status_code === 1) {
                        res.data.signInTime=res.data.data.signInTime.substring(0,10);
                        this.$globalData.userInfo = res.data.data;
                        Cookies.set('shUserId', JSON.stringify(res.data.data.id))
                        this.$router.replace({path: '/index'});
                    } else {
                        this.$message.error(res.data.msg);
                    }
                });
            },
            toIndex() {
                this.$router.replace({path: '/index'});
            }
        }
    }
</script>

<style scoped>
    .login-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      width: 100%;
      background-image: url("https://img.picui.cn/free/2024/07/01/66825fc373fe3.jpg");
      /* 使用背景混合模式，添加一个半透明的黑色覆盖层 */
      background-blend-mode: multiply;
      /* 覆盖层的颜色和透明度 */
      background-color: rgba(0, 0, 0, 0.3);
      /* 确保背景图片能够填充整个元素 */
      background-size: cover;
      background-position: center;
      -webkit-background-size: contain;
    }

    .login-body {
      padding: 30px;
      width: 400px;
      height: 60vh;
      box-sizing: border-box;
      background-color: rgba(236, 236, 236, 0.6);
      border-top-right-radius: 10px;
      border-bottom-right-radius: 10px;
    }

    .login-title {
      font-family: 华文彩云;
      padding-bottom: 30px;
      text-align: center;
      font-weight: 600;
      font-size: 25px;
      color: #409EFF;
      cursor: pointer;
      letter-spacing: 2px;
    }

    .login-input {
        margin-bottom: 20px;
    }

    .login-submit {
        margin-top: 20px;
        display: flex;
        justify-content: center;
    }

    .sign-in-container {
        padding: 0 10px;
    }

    .sign-in-text {
        color: #409EFF;
        font-size: 16px;
        text-decoration: none;
        line-height:28px;
    }
    .other-submit{
        display:flex;
        justify-content: space-between;
        margin-top: 30px;
        margin-left: 200px;
    }
</style>
