<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10" style="margin:10px">
                <div class="card">
                    <div class="card-header">Public Chat Group</div>

                    <div class="card-body" style="overflow-y: scroll;overflow-x: hidden;max-height: 415px;"  ref="feed">
                        <div v-for="mes in messages" :key="mes.id" >

                                <div class="container_chat darker" v-if="user_data == mes.user_id" >
                                <div v-if="mes.user.photo.length <40">
                                <img :src="`/img/${ mes.user.photo}`" alt="Avatar" class="right">
                                </div>
                                <div v-else>
                                <img :src="`${ mes.user.photo}`" alt="Avatar" class="right">
                                </div>
                                <p >{{mes.message}}</p>
                                <span class="time-left">{{mes.created_at}}</span>
                                </div>

                                <div class="container_chat" v-else>
                                <div v-if="mes.user.photo.length <40">
                                <img :src="`/img/${ mes.user.photo}`" alt="Avatar" >
                                </div>
                                <div v-else>
                                <img :src="`${ mes.user.photo}`" alt="Avatar" >
                                </div>
                                <p>{{mes.message}}</p>
                                <span class="time-right">{{mes.created_at}}</span>
                                </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <textarea class="form-control" autofocus v-model="message" @keyup.enter="SendMessage()" placeholder="Write Your Message Here......"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style>
/* body {
  margin: 0 auto;
  max-width: 800px;
  padding: 0 20px;
} */

.container_chat {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

.darker {
  border-color: #ccc;
  background-color: #ddd;
}

.container_chat::after {
  content: "";
  clear: both;
  display: table;
}

.container_chat img {
  float: left;
  max-width: 60px;
  width: 100%;
  margin-right: 20px;
  border-radius: 50%;
}

.container_chat img.right {
  float: right;
  margin-left: 20px;
  margin-right:0;
}

.time-right {
  float: right;
  color: #aaa;
}

.time-left {
  float: left;
  color: #999;
}
</style>

<script>
    export default {
        data(){
            return{
                message:'',
                messages:'',
                user_data:$("meta[name='user-id']").attr('content')

            }
        },
        methods:{
            SendMessage(){
                axios.post('api/chat',{message:this.message}).then((res)=>{
                    Fire.$emit('sending...');
                    Fire.$emit("noti");
                   this.message='';
                }).catch((back)=>{
                    alert('something wrong!')
                });
            },
            GetMessages(){
                axios.get('api/chat').then((res)=>{
                    this.scrollToBottom();
                     this.messages=res.data;
                }).catch((back)=>{
                    alert('something wrong!')
                });
            },
            scrollToBottom(){
                setTimeout(()=>{
                    this.$refs.feed.scrollTop=this.$refs.feed.scrollHeight - this.$refs.feed.clientHeight;
              },5);
            }
           
        },
        mounted() {
                    Pusher.logToConsole = true;
                    var pusher = new Pusher('fe17f884326df2618ed8', {
                        cluster: 'eu',
                        encrypted: true
                        });
                    var channel = pusher.subscribe('sending_message');
                    channel.bind('App\\Events\\sending_message', function(data) {
                        Fire.$emit("sending...");
                        Fire.$emit("noti");
                        });
         
            this.GetMessages();
            Fire.$on('sending...',()=>this.GetMessages());
            Fire.$on("noti",()=>this.$parent.getNoti());

        }
    }
</script>
