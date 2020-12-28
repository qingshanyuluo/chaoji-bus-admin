<template>
  <div>
      <h2>司机管理</h2>
      <el-col :span="1"><h1></h1></el-col>
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
      <el-col :span="1">
        <el-button>添加司机</el-button>
      </el-col>
    </el-col>
  </div>
</template>

<script>
export default {

}
</script>

<style>

</style>