<template>
  <div>
    <el-container style="height: 100%; border: 1px solid #eee">
      <el-header style="text-align: right; font-size: 24px">
        <el-dropdown>
          <i class="el-icon-setting" style="margin-right: 15px;"></i>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>修改密码</el-dropdown-item>
            <el-dropdown-item>个人信息</el-dropdown-item>
            <el-dropdown-item @click.native="exit()">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
        <span>{{ user }}</span>
      </el-header>
      <el-container>
        <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
          <el-menu>
            <!-- <el-menu :default-openeds="['1','2','4','3']"> -->

            <el-submenu index="1">
              <template slot="title"
                ><i class="el-icon-s-data"></i>用户管理</template
              >
              <router-link to="users" tag="div">
                <el-menu-item index="1-1">所有用户</el-menu-item>
              </router-link>
              <router-link tag="query_user" to="history_order">
                <el-menu-item index="1-2">查询信息</el-menu-item>
              </router-link>
            </el-submenu>

            <el-submenu index="2">
              <template slot="title"
                ><i class="el-icon-menu"></i>车辆管理</template
              >
              <el-menu-item-group title="车辆">
                <router-link to="bus" tag="div">
                  <el-menu-item index="2-1">所有车辆</el-menu-item>
                </router-link>
                <router-link to="bus_info" tag="div">
                  <el-menu-item index="2-2">车辆信息</el-menu-item>
                </router-link>
              </el-menu-item-group>
              <el-menu-item-group title="司机">
                <router-link to="driver" tag="div">
                  <el-menu-item index="2-3">所有司机</el-menu-item>
                </router-link>
                <router-link to="driver_info" tag="div">
                  <el-menu-item index="2-4">司机信息</el-menu-item>
                </router-link>
              </el-menu-item-group>
            </el-submenu>
            <el-submenu index="3">
              <template slot="title"
                ><i class="el-icon-setting"></i>企业管理</template
              >
              <router-link to="enterprise" tag="div">
                <el-menu-item index="3-1">所有企业</el-menu-item>
              </router-link>
              <router-link tag="div" to="enterprise_info">
                <el-menu-item index="3-2">查询信息</el-menu-item>
              </router-link>
            </el-submenu>
            <el-submenu index="4">
              <template slot="title"
                ><i class="el-icon-setting"></i>订单管理</template
              >
              <el-menu-item-group>
                <template slot="title">企业订单</template>
                <router-link to="long_term_order" tag="div">
                  <el-menu-item index="4-1">长期订单</el-menu-item>
                </router-link>
                <router-link to="enterprise_order">
                  <el-menu-item index="4-2">企业订单</el-menu-item>
                </router-link>
              </el-menu-item-group>
              <el-menu-item-group title="个人订单">
                <router-link to="order" tag="div">
                  <el-menu-item index="4-3">所有订单</el-menu-item>
                </router-link>
              </el-menu-item-group>
              <el-menu-item-group title="详情查询">
                <router-link to="order_info">
                  <el-menu-item index="4-4">订单详情</el-menu-item>
                </router-link>
              </el-menu-item-group>
            </el-submenu>
          </el-menu>
        </el-aside>

        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import db from "../utils/localstorage.js";
export default {
  name: "Home",
  components: {},
  data() {
    const item = {
      date: "2016-05-02",
      name: "王小虎",
      address: "上海市普陀区金沙江路 1518 弄",
    };
    return {
      tableData: Array(20).fill(item),
      user: "管理员",
    };
  },
  methods: {
    exit() {
      this.$store.commit("account/reLogin");
      db.clear();
      this.$router.push("/login").then(() => {
        this.$message.success("已注销");
      });
    },
  },
};
</script>

<style scoped>
.el-header {
  background-color: #76a7e7;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}
</style>
