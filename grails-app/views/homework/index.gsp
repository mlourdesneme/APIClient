<!doctype html>
<html>
<head>
    <meta name="layout" content="test"/>
    <title>Listado de categorias</title>
    <script src="https://unpkg.com/vue/dist/vue.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>

<body>

    <div class="main" id="categories">

        <div class="d-flex flex-row">

            <div class="mb-3">
                <select class="mt-5 ml-5" name="" id="select" onchange="category.fetchData(this.value)">
                <g:each in="${sites}" var="site">
                    <option value="${site?.id}">${site?.name}</option>
                </g:each>
                </select>
            </div>

            <div id="rutas" class="d-none" style="margin-top: 38px;" >
                <span id="path" @click="category.fetchDataSubCategory()" v-for=""> >{{}}</span>
            </div>
        </div>

        <div class="d-flex justify-content-center flex-row">

            <div id="category" style="width: 60%;">

                <!-- Tabla de articulos-->
                <table id="tabla" border="1">
                    <thead>
                        <tr>
                            <td class="text-center font-weight-bold">Id</td>
                            <td class="text-center font-weight-bold">Nombre</td>
                        </tr>
                    </thead>
                    <tr v-for="category in categories">
                        <td class="text-center"><a href="#" @click="obtenerid(category.id)">{{ category.id }}</a></td>
                        <td class="text-center">{{ category.name }}</td>
                    </tr>
                </table>

                <div class="w-100 d-flex justify-content-center">
                    <button type="button" class="btn btnModal" id="agregar" onclick="addArticulo()">Agregar</button>
                </div>
                <!--  MODAL -->
                <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="modalCat" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header d-flex justify-content-center flex-row">
                                <h5 class="modal-title text-center" id="titulo">CATEGORIA: {{category.finalcategory.name}}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h3>ID:</h3>
                                <h4>{{category.finalcategory.id}}</h4>
                                <h3>Nombre:</h3>
                                <h4>{{category.finalcategory.name}}</h4>
                                <h3>Enlace a imagen:</h3>
                                <h3 class="linkimg"><a id="imglink">{{category.finalcategory.picture}}</a></h3>
                                <h3>Picture:</h3>
                                <div class="d-flex justify-content-center w-100">
                                    <img id="img" width="50px" height="50px">
                                </div>
                                <h3>Cantidad de items:</h3>
                                <h4>{{category.finalcategory.total_items_in_this_category}}</h4>
                            </div>
                            <div class="modal-footer d-flex justify-content-center">
                                <button type="button" class="btn btnModal" id="editar" @click="editArticulo(category.finalcategory.id)">Edit</button>
                                <button type="button" class="btn btnModal" id="eliminar" data-dismiss="modal" @click="deleteArticulo(category.finalcategory)">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- MODAL-->
            </div>
        </div>
    </div>

    <script>
        var category= new Vue({
            el: '#category',
            data:{
                //key: []
                categories:[],
                finalcategory: [],
                pathcategory: []
            },
            methods:{
                fetchData: function(idSite){
                    axios.get('/homework/selectCategory', {
                        params:{
                            id: idSite
                        }
                    }).then(function (response) {
                        category.categories= response.data.categories;
                    }).catch(function (error) {
                        console.log(error)
                    })
                },
                fetchDataSubCategory: function(idCategory){
                    axios.get('/homework/selectSubCategory', {
                        params:{
                            id: idCategory
                        }
                    }).then(function (response) {
                        category.categories= response.data.subcategories.children_categories;
                        if(category.categories.length == 0){
                            category.finalcategory= response.data.subcategories
                            document.getElementById("img").src = category.finalcategory.picture;
                            document.getElementById("imglink").href = category.finalcategory.picture;
                            mostrarModal()
                        }
                    }).catch(function (error) {
                        console.log(error)
                    })
                },
                fetchDataDeleteCategory: function (id) {
                    axios.get('/homework/delete', {
                        params: {
                            id: id
                        }
                    }).then(function (response) {
                        alert("eliminado")
                    }).catch(function (error) {
                        console.log(error)
                    })
                }
            }
        })

        function obtenerid (id){
            category.fetchDataSubCategory(id);
        }

        function mostrarModal() {
            $(document).ready(function(){
         //ocultar tabla
                $("#tabla").hide();
        // Show the Modal on load
                $("#myModal").modal("show");

        // Hide the Modal
                $("#myBtn").click(function(){
                    $("#myModal").modal("hide");
                });
        //mostrar tabla
                $("#tabla").show();
            });

        }

        function addArticulo() {
            var idM = document.getElementById("select").value;
            location.href="http://localhost:8084/homework/create?id="+idM;
        }

        function editArticulo(id){
            alert("entre aca");
           location.href= "http://localhost:8084/homework/edit?id="+id;
        }

        function deleteArticulo(cat){
            alert("hola");
            category.fetchDataDeleteCategory(cat.id);
        }


    </script>


</body>

</html>