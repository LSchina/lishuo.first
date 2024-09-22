<template>
  <div>
    <el-card style="width: 100%;height: 80vh">
      <div style="width: 100%;height: 18vh;display: flex;justify-content: space-between;align-items: center">
        <el-card style="width: 200px;height: 17vh;display: flex;padding: 10px;box-sizing: border-box" v-for="item in itemList" :key="item" :style="{'background': item.color}">
          <div style="width: 100%;height: 100%;display: flex;">
            <div style="width: 50%;height: 100%;display: flex;justify-content: center;align-items: center">
              <i style="font-size: 30px;color: white" :class="item.icon"></i>
            </div>
            <div
                style="font-size: 20px;width: 80px;height: 100%;display: flex;justify-content: center;align-items: center;">
              <div>{{ item.intro }}</div>
            </div>
            <div
                style="font-size: 20px;width: 50%;height: 100%;display: flex;justify-content: center;align-items: center;">
              <div>{{ item.count }}</div>
            </div>
          </div>
        </el-card>
      </div>
      <div style="width: 100%;height: 60vh;display: flex">
        <div style="width: 60%;height: 400px;" ref="chart" :style="{ width: '60%', height: '400px' }"></div>
        <div style="width: 50%;height: 60vh;">
          <!--   日历start   -->
          <div style="width: 100%;margin-top: 20px">
            <vc-calendar color="red" style="width: 100%;height: 40vh" :is-dark="false" v-model="data" :attributes='attrs' expanded/>
          </div>
          <div style="width: 100%;margin-top: 30px">
            <el-button @click="backToday" style="width: 100%;border-radius: 8px;background-color: #409EFF;height: 40px">
              <div style="color: white;font-weight: 600;letter-spacing: 2px;font-family: 楷体;font-size: 18px">回到今天</div>
            </el-button>
          </div>
          <!--   日历end   -->
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
import * as echarts from "echarts";

export default {
  name: "backHome",
  created() {
    this.getData();
    this.getOrderData();
  },
  data() {
    return {
      itemList:[
        {
          color: '#409EFF',
          icon:'el-icon-user-solid',
          count: 10,
          intro: '用户'
        },
        {
          color: '#67C23A',
          icon:'el-icon-s-goods',
          count: 30,
          intro: '闲置'},
        {
          color: '#E6A23C',
          icon:'el-icon-s-shop',
          count: 20,
          intro:'交易'},
        {
          color: '#F56C6C',
          icon:'el-icon-s-comment',
          count: 35,
          intro:'消息'
        }
      ],
      data: new Date(),
      attrs: [
        {
          key: 'today',
          highlight: true,
          dates: new Date(),
        },
      ],
      /**
       * 折线图实例
       */
      chartInstance: null,
      options: {
        tooltip: {
          trigger: 'item'
        },
        legend: {
          top: '5%',
          left: 'center'
        },
        series: [
          {
            name: '数量',
            type: 'pie',
            radius: ['40%', '70%'],
            avoidLabelOverlap: false,
            padAngle: 5,
            itemStyle: {
              borderRadius: 10
            },
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: true,
                fontSize: 40,
                fontWeight: 'bold'
              }
            },
            labelLine: {
              show: false
            },
            data: [
              { value: 0, name: '待付款' },
              { value: 0, name: '待发货' },
              { value: 0, name: '待收货' },
              { value: 0, name: '已完成' },
              { value: 0, name: '已取消' }
            ]
          }
        ]
      }
    }
  },
  beforeDestroy() {
    if (this.chartInstance) {
      this.chartInstance.dispose();
    }
  },
  methods: {
    backToday() {
      this.data = new Date();
    },
    getData() {
      this.$api.getHomeData().then(res => {
        if(res.data.status_code==1){
          for (let i = 0; i < res.data.data.length; i++) {
            this.itemList[i].count = res.data.data[i];
          }
        }else {
          this.$message.error(res.data.msg)
        }
      }).catch(e => {
        console.log(e)
      })
    },
    getOrderData(){
      this.$api.getOrderData().then(res => {
        if (res.data.status_code === 1){
          for (let i = 0; i < res.data.data.length; i++) {
            this.options.series[0].data[i].value = res.data.data[i];
          }
          console.log(this.options)
        }
        this.initChart()
      }).catch(e => {
        console.log(e)
      })
    },
    initChart() {
      this.chartInstance = echarts.init(this.$refs.chart);
      this.chartInstance.setOption(this.options);
    },
  }
}
</script>

<style scoped>

</style>