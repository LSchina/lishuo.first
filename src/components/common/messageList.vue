<template>

  <div class="main-border">
    <el-table
        :data="Message"
        stripe
        style="width: 100%;color: #5a5c61;">
      <el-table-column
          type="index"
          label="编号"
          show-overflow-tooltip
          width="100">
      </el-table-column>
      <el-table-column
          prop="name"
          label="姓名"
          show-overflow-tooltip
          width="130"
      >
      </el-table-column>
      <el-table-column
          prop="idleName"
          label="物品名称"
          show-overflow-tooltip
          width="120"
      >
      </el-table-column>
      <el-table-column
          prop="toName"
          label="目标人物"
          show-overflow-tooltip
          min-width="100"
          width="120">
      </el-table-column>
      <el-table-column
          prop="createTime"
          label="创建时间"
          show-overflow-tooltip
          min-width="150"
          width="200">
      </el-table-column>
<!--      <el-table-column-->
<!--          label="订单状态"-->
<!--          width="100"-->
<!--          show-overflow-tooltip>-->
<!--        <template slot-scope="scope">-->
<!--          <div>{{orderStatus[scope.row.orderStatus]}}</div>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column
          prop="content"
          label="内容"
          width="300"
          show-overflow-tooltip>
      </el-table-column>
<!--      <el-table-column-->
<!--          prop="paymentTime"-->
<!--          label="支付时间"-->
<!--          show-overflow-tooltip>-->
<!--      </el-table-column>-->
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="danger"
              @click="deleteMessage(scope.$index)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="block">
      <el-pagination
          @current-change="handleCurrentChange"
          :current-page.sync="nowPage"
          :page-size="8"
          background
          layout="prev, pager, next,jumper"
          :total="total">
      </el-pagination>
    </div>
  </div>
</template>

<script>
export default {
  name: "messageList",
  created() {
    this.getMessage();
  },
  methods:{
    getMessage(){
      this.$api.getMessageList({
        page: this.nowPage,
        nums:8
      }).then(res => {
        if(res.data.status_code==1){
          console.log(res)
          this.Message = res.data.data.list;
          this.total = res.data.data.count;
        }else {
          this.$message.error(res.data.msg)
        }

      }).catch(e => {
        console.log(e)
      })
    },
    deleteMessage(index) {
      this.$api.deleteAdminMessage({
        id: this.Message[index].id
      }).then(res => {
        if (res.data.status_code == 1) {
          this.getMessage();
        } else {
          this.$message.error(res.data.msg)
        }

      }).catch(e => {
        console.log(e)
      })
    },
    handleCurrentChange(val) {
      this.nowPage = val;
      this.getMessage();
    },
  },
  data(){
    return {
      mode:1,
      nowPage: 1,
      total: 0,
      paymentStatus:['未支付','已支付'],
      orderStatus:['待付款','待发货','待收货','已完成','已取消'],
      Message: []
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
</style>