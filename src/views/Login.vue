<template>
  <div style="padding-top: 10%">
    <el-col :span="8"><h1></h1></el-col>
    <el-col :span="8">
      <el-card class="box-card">
        <h1>管理员登录</h1>
        <el-input
          v-model="phone"
          placeholder="手机号"
          clearable
          class="p"
        ></el-input>
        <el-input
          v-model="password"
          placeholder="密码"
          clearable
          show-password
          class="p"
        ></el-input>

        <el-button type="primary" round class="p" @click="login()"
          >登录</el-button
        >
      </el-card>
    </el-col>

    <el-col :span="8"><h1></h1></el-col>
  </div>
</template>

<script>
import service from "@/utils/request";
export default {
  data() {
    return {
      phone: "",
      password: "",
    };
  },
  methods: {
    login() {
      // console.log(this.phone);
      service
        .post("/user/login", {
          phone: this.phone,
          password: this.password,
        })
        .then((res) => {
          console.log(res);
          if (res.data.status_code === 200) {
            console.log(res.data.data);
            console.log(res.data.data.user.type);
            if (res.data.data.user.type !== 0) {
              alert("你不是管理员");
            } else {
              this.$store.commit("setUserID", res.data.data.user.id);
              this.$store.commit("setToken", res.data.data.token);
              this.$router.push("/home");
            }
          } else {
            alert(res.data.message);
          }
        });
    },
  },
};
</script>

<style>
.p {
  padding: 10px;
}
</style>