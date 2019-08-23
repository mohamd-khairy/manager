<template>
  <div class="container">
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="fa fa-bell" style="font-size: 20px;"></i>
        <span class="badge badge-warning navbar-badge" style="margin:15px">{{notifications.length}}</span>
      </a>
      <div
        class="dropdown-menu dropdown-menu-lg dropdown-menu-right"
        style="width:1200px;overflow-y: scroll;overflow-x: hidden;max-height: 150px;"
      >
        <div v-for="noti in notifications" :key="noti.id">
          <a
            href="#"
            class="dropdown-item"
            @click="makeAsRead(noti)"
            v-if="(noti.data.type)=='message'"
          >
            <div v-if="noti.data.emp.user.photo.length <40">
              <img
                v-bind:src="`./img/${noti.data.emp.user.photo}`"
                class="img-circle"
                style="width:30px;height:25px"
              >
              New Message from {{ noti.data.emp.user.name}}
            </div>
            <div v-else>
              <img
                v-bind:src="`${noti.data.emp.user.photo}`"
                class="img-circle"
                style="width:30px;height:25px"
              >
              New Message from {{ noti.data.emp.user.name}}
            </div>

            <span class="float-right text-muted text-sm">3 mins</span>
          </a>

          <a href="#" class="dropdown-item" @click="makeAsRead(noti)" v-else>
            <img
              v-bind:src="`./img/${noti.data.emp.photo}`"
              class="img-circle"
              style="width:30px;height:25px"
            >
            {{ noti.data.emp.name}} is A New Employee
            <span
              class="float-right text-muted text-sm"
            >3 mins</span>
          </a>

          <div class="dropdown-divider"></div>
        </div>
        <div v-if="notifications.length == 0" class="dropdown-item">
          There is no notification now.
          <div class="dropdown-divider"></div>
        </div>

        <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
      </div>
    </li>
  </div>
</template>

<script>
export default {
  props: ["notifications", "user"],
  methods: {
    makeAsRead(noti) {
      var data = {
        id: noti.id,
        type: noti.data.type
      };
      axios.post("api/notify/read", data).then(res => {
        res.data == "message"
          ? (window.location.href = "/dashboard")
          : (window.location.href = "/employes");
      });
    }
  },
  mounted() {
    console.log("Component mounted.");
  }
};
</script>
