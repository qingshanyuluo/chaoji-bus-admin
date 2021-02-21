<template>
  <div>
    <el-popover
      placement="right"
      width="500"
      trigger="click"
      style="padding: 10%"
    >
      <div class="">
        <h3>添加司机</h3>
        <el-input
          placeholder="姓名"
          prefix-icon="el-icon-user"
          v-model="new_driver.name"
        >
        </el-input>
        <el-input
          placeholder="年龄"
          prefix-icon="el-icon-info"
          v-model="new_driver.age"
        >
        </el-input>
        <el-input
          placeholder="驾驶证号"
          prefix-icon="el-icon-info"
          v-model="new_driver.driver_license_number"
        >
        </el-input>
        <el-input
          placeholder="驾驶证到期 格式 yyyy-MM-dd HH:mm:ss"
          prefix-icon="el-icon-info"
          v-model="new_driver.driver_license_expired_date"
        >
        </el-input>
        <el-input
          placeholder="资格证号"
          prefix-icon="el-icon-info"
          v-model="new_driver.qualification_certificate_number"
        >
        </el-input>
        <el-input
          placeholder="资格证到期 格式 yyyy-MM-dd HH:mm:ss"
          prefix-icon="el-icon-info"
          v-model="new_driver.qualification_certificate_expired_date"
        >
        </el-input>
        <el-input
          placeholder="入职时间 格式 yyyy-MM-dd HH:mm:ss"
          prefix-icon="el-icon-info"
          v-model="new_driver.entry_date"
        >
        </el-input>
        <el-input
          placeholder="电话号"
          prefix-icon="el-icon-info"
          v-model="new_driver.phone_number"
        >
        </el-input>
        <el-input
          show-password
          placeholder="密码"
          prefix-icon="el-icon-info"
          v-model="new_driver.password"
        >
        </el-input>
        <el-input
          placeholder="性别 1 为男 2 为女"
          prefix-icon="el-icon-info"
          v-model="new_driver.gender"
        >
        </el-input>
        <el-input
          placeholder="车辆id"
          prefix-icon="el-icon-info"
          v-model="new_driver.bus_id"
        >
        </el-input>
        <el-input
          placeholder="状态1可用0不可用"
          prefix-icon="el-icon-info"
          v-model="new_driver.status"
        >
        </el-input>
        <el-button @click="add()">
          添加
        </el-button>
      </div>

      <el-button slot="reference">添加司机</el-button>
    </el-popover>
    <h2 style="display: inline">司机管理</h2>
    <el-col :span="22">
      <el-table :data="tableData" style="width: 100%" stripe>
        <el-table-column prop="id" label="编号" width="50"> </el-table-column>
        <el-table-column prop="create_time" label="创建时间" width="150">
        </el-table-column>
        <el-table-column prop="start_time" label="出行时间" width="160">
        </el-table-column>
        <el-table-column prop="start_location" label="起点" width="180">
        </el-table-column>
        <el-table-column prop="end_location" label="终点" width="180">
        </el-table-column>
        <el-table-column prop="money" label="金额" width="90">
        </el-table-column>
        <el-table-column prop="assigned" label="分配状态" width="90">
        </el-table-column>
      </el-table>
      <el-col :span="1"> </el-col>
    </el-col>
  </div>
</template>

<script>
import service from "@/utils/request";
export default {
  data() {
    return {
      new_driver: {
        name: "",
        age: null,
        id_number: "",
        driver_license_number: "",
        driver_license_expired_date: "",
        qualification_certificate_number: "",
        qualification_certificate_expired_date: "",
        entry_date: "",
        phone_number: "",
        password: "",
        gender: null,
        bus_id: 0,
        img_url: "string",
        status: 0
      },
      tableData: {

      }
    };
  },
  methods: {
    add() {
      service.post("/driver/add", this.new_driver)
      .then((res)=>{
        console.log(res);
        if (res.data.status_code === 200) {
          alert(res.data.message);
        }
      })
    }
  },
  mounted() {
    console.log("loading");
    service
      .get('/driver/getAll')
      .then((res) => {
        this.tableData = res.data.data
        console.log(this.tableData)
      })
  },
};
</script>

<style>
input{
  padding: 10%;
}
</style>