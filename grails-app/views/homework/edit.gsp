<!doctype html>
<html>
<head>
    <meta name="layout" content="test"/>
    <title>Editar Articulo</title>
    <script src="https://unpkg.com/vue/dist/vue.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>

<body>
    <div class="w-100 d-flex justify-content-center mt-5 ml-0">
        <form>
            <div class="form-group">
                <label for="name">Nombre</label>
                <input type="text" class="form-control" id="name" placeholder="">
            </div>
            <div class="form-group">
                <label for="url">URL</label>
                <input type="text" class="form-control" id="url" placeholder="">
            </div>
            <div class="form-group">
                <label for="items">Cantidad de items</label>
                <input type="text" class="form-control" id="items" placeholder="">
            </div>
            <div class="form-group row">
                <div class=" d-flex flex-row justify-content-center">
                    <button type="submit" class="btn btn-primary mr-2" onclick="editar()">Confirmar</button>
                    <button type="submit" class="btn btn-primary" onclick="volverInicio()">Cancelar</button>
                </div>
            </div>
        </form>
    </div>

    <script>

        var category= new Vue({
            el: '#category',
            data:{
                //key: []
                categories:[]
            },
            methods:{
                fetchDataEditCategory: function (id) {
                    var articulo = ({
                        "name": document.getElementById("name").value,
                        "picture": document.getElementById("url").value,
                        "total_items_in_this_category": document.getElementById("items").value,
                    })
                    alert("hola primeor")
                    axios.get('/homework/editArt',
                        {params: {
                            articulo: articulo
                        }
                    }).then(function () {
                        alert("hola")
                        location.href= "http://localhost:8084/homework/index"
                    }).catch(function (error) {
                        console.log(error)
                    })
                }
            }
        })

        function editar() {
            var urlParams = new URLSearchParams(window.location.search);
            console.log(urlParams.get('id'));
            category.fetchDataEditCategory("2");

        }

        function volverInicio(){
            alert("go to home")
            location.href= "http://localhost:8084/homework/index";
        }

    </script>
</body>