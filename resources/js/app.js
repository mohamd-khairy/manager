
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */
require('./bootstrap');

window.Vue = require('vue');
import moment from 'moment';
import { Form, HasError, AlertError } from 'vform';

 import Gate from "./Gate";
 Vue.prototype.$gate = new Gate(window.user);


import Swal from 'sweetalert2'
window.Swal = Swal;

const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});

window.Toast = Toast;

window.Fire=new Vue();

window.Form = Form;
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)

Vue.component('pagination', require('laravel-vue-pagination'));

Vue.prototype.$userId = document.querySelector("meta[name='user-id']").getAttribute('content');


import VueRouter from 'vue-router'
Vue.use(VueRouter)

import VueProgressBar from 'vue-progressbar'

import Axios from 'axios'

Vue.use(VueProgressBar, {
    color: 'rgb(143, 255, 199)',
    failedColor: 'red',
    height: '3px'
  })

let routes=[
    {path:'/home' , component: require('./components/dashboard.vue').default},
    {path:'/dashboard' , component: require('./components/dashboard.vue').default},
    {path:'/users' , component: require('./components/users.vue').default},
    {path:'/developer' , component: require('./components/Developer.vue').default},
    {path:'/employes' , component: require('./components/Employes.vue').default},
    {path:'/profile' , component: require('./components/Profile.vue').default},
    {path:'/datatable' , component: require('./components/DataTableUser.vue').default},
    {path:'*' , component: require('./components/NotFound.vue').default}
]

const router = new VueRouter({
    mode: 'history',
    routes // short for `routes: routes`
  })

Vue.filter('upText', function(text){
    return text.charAt(0).toUpperCase() + text.slice(1)
});

Vue.filter('myDate',function(created){
    return moment(created).format('MMMM Do YYYY');
});

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));
Vue.component(
    'passport-clients',
    require('./components/passport/Clients.vue').default
);

Vue.component(
    'passport-authorized-clients',
    require('./components/passport/AuthorizedClients.vue').default
);

Vue.component(
    'passport-personal-access-tokens',
    require('./components/passport/PersonalAccessTokens.vue').default
);
Vue.component(
    'not-found',
    require('./components/NotFound.vue').default
);
Vue.component('notification', require('./components/notification.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router,
    data:{
        search:"",
        notifications:"",
        m:$("meta[name='user']").attr('content')
    },
    methods:{
        searchit:_.debounce(()=>{ // debounce make serve wait to make event for 2 second
            // console.log("search....");
            Fire.$emit('searching');
        },1000),
        printme() {
            window.print();
        },
        getNoti(){
            axios.post("api/getNoti").then((res)=>{
                this.notifications=res.data;
            });
        }
    },
    created(){
        this.getNoti();
    //    Fire.$on("noti_sent",()=>this.getNoti());
        // var User_id=$("meta[name='user-id']").attr('content');
        // Echo.private(`App.User.${User_id}`)
        //     .notification((notification) => {
        //          console.log(notification);
        //         this.notifications.push(notification);
        //     });
        
    }
});
