
<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                 <table class="table table-bordered" id="myTable">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
       
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
