<template>
    <div class="container">
         <div class="row mt-5" >
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                  <h3 class="card-title">
                
                All Employees Added</h3>

                <div class="card-tools">
                    <button class="btn btn-danger"  @click="DeleteAllEmp(empIds)">Delete All Checked<i class="fas fa-trash fa-fw"></i></button>
                    <button class="btn btn-primary" @click="openModalExcel" >Excel <i class="fas fa-file fa-fw"></i></button>
                    <a class="btn btn-primary" :href="`api/pdfEmp/${empIds}`" >PDF <i class="fas fa-file fa-fw"></i></a>
                    <a class="btn btn-primary" :href="`api/WordEmp/${empIds}`" >Word <i class="fas fa-file fa-fw"></i></a>
                    <button class="btn btn-warning" @click="openModalEmail(false,false)">Send Email <i class="fas fa-user-plus fa-fw"></i></button>
                    <button class="btn btn-success" @click="openModal">Add New <i class="fas fa-user-plus fa-fw"></i></button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody><tr>
                    <th><input type="checkbox" @click="selectAll" v-model="allSelected"></th>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>City</th>
                    <th>mobile</th>
                    <th>Add_By</th>
                    <th>Status</th>
                    <th>Photo</th>
                    <th>Modify</th>
                  </tr>
                  <tr v-for="(emp, index) in employees.data" :key="emp.id">
                    <th><input type="checkbox" v-model="empIds" @click="select"  :value="emp.id"></th>
                    <td>{{index+1}}</td>
                    <td>{{emp.name}}</td>
                    <td>{{emp.email}}</td>
                    <td>{{emp.city}}</td>
                    <td>{{emp.mobile}}</td>
                    <td>{{emp.user.name}}</td>
                    <td>{{emp.status}}</td>
                    <td>
                        <img v-bind:src="`./img/${emp.photo}`" class="img-circle" style="width:45px;height:40px">
                     </td>
                    <td>
                        <!-- <a href="api/email-test"><i class="fa fa-envelope"></i></a> | -->
                        <a href="#" @click="openModalEmail(emp,true)" ><i class="fa fa-envelope"></i></a> |
                        <a href="#" @click="EditEmp(emp)"><i class="fa fa-edit"></i></a> |
                        <a href="#" @click="DeleteEmp(emp.id)"><i class="fa fa-trash"></i></a>
                    </td>
                  </tr>
                </tbody>
                </table>
              </div>
              <!-- /.card-body -->
               <div class="card-footer">
                  <pagination :data="employees" @pagination-change-page="getResultsEmp"></pagination>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
            <div class="modal fade" id="modalExcel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog  modal-dialog-centered"  role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title"  id="addNewLabel">Export / Import Excel File</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <a   :href="`api/export/excel/${empIds}`" class="btn btn-success">Export</a>
                                </div>
                                    <form method="post" action="api/import/excel" enctype="multipart/form-data">
                                        <div class="form-group">
                                            Import: <input  type="file" class="form-control"  name="file_excel" >
                                        </div>
                                        <button type="submit" class="btn btn-success">Import</button>
                                    </form>
                            </div>

                            <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                    </div>            
                </div>
            </div>
            <div class="modal fade" id="addNewEmp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog  modal-dialog-centered"  role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" v-show="!editMode" id="addNewLabel">Add New Employee</h5>
                            <h5 class="modal-title" v-show="editMode" id="addNewLabel">Edit Employee</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form @submit.prevent=" editMode ? UpdateEmp() : CreatEmp()" method="post" enctype="multipart\form-data">
                            <div class="modal-body">
                                <div class="form-group">
                                    <input  type="text" v-model="form.name" name="name" :class="{ 'is-invalid': form.errors.has('name') }" placeholder="Name" class="form-control">
                                    <has-error :form="form" field="name"></has-error>
                                </div>

                                <div class="form-group">
                                    <input  type="email" v-model="form.email" name="email" :class="{ 'is-invalid': form.errors.has('email') }" placeholder="email" class="form-control">
                                    <has-error :form="form" field="email"></has-error>
                                </div>
                            
                                <div class="form-group">
                                    <input  type="text" v-model="form.city" name="city" :class="{ 'is-invalid': form.errors.has('city') }" placeholder="city" class="form-control">
                                    <has-error :form="form" field="city"></has-error>
                                </div>
                         
                                <div class="form-group">
                                    <input  type="number" v-model="form.mobile" name="mobile" :class="{ 'is-invalid': form.errors.has('mobile') }" placeholder="mobile" class="form-control">
                                    <has-error :form="form" field="mobile"></has-error>                                
                                </div>
                           
                                <div class="form-group">
                                    <select name="status" :class="{ 'is-invalid': form.errors.has('status') }" class="form-control" v-model="form.status">
                                        <option value="">Select Employee Status</option>
                                        <option value="work">Work</option>
                                        <option value="not work">Not Work</option>
                                    </select>
                                    <has-error :form="form" field="status"></has-error>
                                </div>

                                <div class="form-group">
                                    <div class="row col-sm-12">
                                        <input  type="file" class="form-control"  @change="updateImage" name="photo" :class="sizeInput +{ 'is-invalid': form.errors.has('photo')}"  >
                                        <img :src="(form.photo.length >200)? form.photo : 'img/'+form.photo" v-show="visible" class="img-circle" style="width:45px;height:40px" :class="sizeImg" />
                                    </div>
                                    <has-error :form="form" field="photo"></has-error>                                
                                </div>
                            </div>

                            <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" v-show="!editMode"  class="btn btn-primary">Create</button>
                                    <button type="submit" v-show="editMode"  class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>            
                </div>
            </div>
            <div class="modal fade" id="email_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog  modal-dialog-centered"  role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addNewLabel">Send Email</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                            <div class="modal-body">

                                <div class="form-group" v-show="visible">
                                    <select  class="form-control" v-model="Email_name" @change="onChangeEmailModal()" >
                                    <option value="">Select Employee</option>
                                    <option v-for="item in employees.data" :value="item.email" :key="item.id">
                                    {{ item.name }}
                                    </option>
                                    </select>
                                </div>
                                <div class="form-group" v-show="visible">
                                    <input  type="email" v-model="Email_email"  placeholder="email" class="form-control">
                                </div>

                                <div class="form-group">
                                    <input  type="text" v-model="Email_text"  placeholder="text" class="form-control">
                                </div>

                                <!-- <div class="form-group">
                                        <input  type="file" class="form-control" name="Email_file" >
                                </div> -->
                            </div>

                            <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button"  @click="do_send_email()"  class="btn btn-primary">Send</button>
                            </div>
                    </div>            
                </div>
            </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                selected: [],
                allSelected: false,
                empIds: [0],
                Email_name:'',Email_text:'',Email_email:'',Email_file:'',
                email_send:'',
                editMode:false,
                sizeInput:'',
                sizeImg:'',
                visible:false,
                employees:{},
                form:new Form({
                    id:'',name:'',email:'',mobile:'',photo:'',status:'',city:''
                }),
            }
        },
        methods:{
            DeleteAllEmp(ids){
                if(ids <= 0){
                    alert('please select any employee to delete');
                }
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {
                        if (result.value) {
                                this.$Progress.start();
                                 axios.post("api/emp/deleteAll/"+ids,{_method: 'delete'})
                                .then((res)=>{
                                    this.getEmployeesData();
                                    Toast.fire({
                                        type: 'success',
                                        title: 'employees Deleted in successfully'
                                    })
                                    this.$Progress.finish();
                                })
                                .catch((r)=>{
                                    this.$Progress.fail();
                                    Swal.fire("Failed!", "There was something wronge.", "warning");
                                });
                        }
                    });

            },
            selectAll: function() {
                this.empIds = [];

                if (!this.allSelected) {
                    for (user in this.employees.data) {
                        this.empIds.push(this.employees.data[user].id);
                    }
                   // 
               }
            },
            select: function() {
                this.allSelected = false;
            },
            getResultsEmp(page = 1){
                axios.get("api/employee?page="+page).then(response=>{
                    this.employees = response.data;
                });
            },
            getEmployeesData(){
                axios.get("api/employee")
                .then((response)=> {this.employees=response.data})
                .catch(()=>{ });
            },
            openModal(){
                this.editMode=false;
                this.sizeInput="";
                this.sizeImg="";
                this.visible=false;
                this.form.reset();
                 $('#addNewEmp').modal('show');
            },
            updateImage(e){
                this.sizeInput="col-sm-10 ";
                this.sizeImg="col-sm-2";
                this.visible=true;
                let file = e.target.files[0];
                let reader = new FileReader();
                let limit = 1024 * 1024 * 2;
                if(file['size'] > limit){
                    Swal.fire({
                        type: 'error',
                        title: 'Oops...',
                        text: 'You are uploading a large file',
                    })
                    return false;
                }

                reader.onloadend = (file) => {
                    this.form.photo = reader.result;
                }
                reader.readAsDataURL(file);
            },
            CreatEmp(){
                this.$Progress.start();
                this.form.post("api/employee")
                .then((res) =>{ 
                    this.getEmployeesData();
                     $('#addNewEmp').modal('hide');
                    this.form.reset();
                    Toast.fire({
                        type: 'success',
                        title: 'Created in successfully'
                    });
                    this.$Progress.finish();
                })
                .catch((r)=>{
                     this.$Progress.fail();
                     Swal.fire("Failed!", "There was something wronge.", "warning");
                });
            },
            DeleteEmp(emp_id){ 
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {
                        if (result.value) {
                                this.$Progress.start();
                                 this.form.delete("api/employee/"+emp_id)
                                .then((res)=>{
                                    this.getEmployeesData();
                                    Toast.fire({
                                        type: 'success',
                                        title: 'this employe has been Deleted in successfully'
                                    })
                                    this.$Progress.finish();
                                })
                                .catch((r)=>{
                                    this.$Progress.fail();
                                    Swal.fire("Failed!", "There was something wronge.", "warning");
                                });
                        }
                    });
            },
            EditEmp(emp){
                this.editMode=true;
                this.sizeInput="col-sm-10 ";
                this.sizeImg="col-sm-2";
                this.visible=true;
                this.form.reset();
                this.form.fill(emp);
                $('#addNewEmp').modal('show');
            },
            UpdateEmp(){
                this.$Progress.start();
                this.form.put("api/employee/"+this.form.id)
                .then((res) =>{ 
                    this.getEmployeesData();
                     $('#addNewEmp').modal('hide');
                    this.form.reset();
                    Toast.fire({
                        type: 'success',
                        title: 'Updated in successfully'
                    })
                    this.editMode=false;
                    this.sizeInput="";
                    this.sizeImg="";
                    this.visible=false;
                    this.$Progress.finish();
                })
                .catch((r)=>{
                     this.$Progress.fail();
                     Swal.fire("Failed!", "There was something wronge.", "warning");
                });
            },
            openModalExcel(){
                $("#modalExcel").modal("show");
            },
            openModalEmail(emp,type){
                if(!type){
                    this.visible=true;
                }else{
                    this.Email_email=emp.email;
                }
                this.Email_text="";
                this.Email_email="";
                $("#email_modal").modal("show");
            },
            onChangeEmailModal(){
                this.Email_email=this.Email_name;
            },
            do_send_email(){
                var data={
                        email:this.Email_email,
                        text:this.Email_text,
                    }
                axios.get("api/email-test/"+this.Email_email+"/"+this.Email_text).then((res)=>{
                     $("#email_modal").modal("hide");
                    this.Email_text="";
                    this.Email_email="";
                })
            }
        },
        mounted() {
                  Pusher.logToConsole = true;
                    var pusher = new Pusher('fe17f884326df2618ed8', {
                        cluster: 'eu',
                        encrypted: true
                        });
                    var channel = pusher.subscribe('update_employee');
                    channel.bind('App\\Events\\update_employee', function(data) {
                        Fire.$emit("after_add");
                        Fire.$emit("noti");
                        });
            this.getEmployeesData();
            Fire.$on("after_add",()=>this.getEmployeesData());
            Fire.$on("noti",()=>this.$parent.getNoti());

        }
    }
</script>
