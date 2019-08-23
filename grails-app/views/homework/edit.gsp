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
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" placeholder="${articulo.name}">
            </div>
            <div class="form-group">
                <label for="url">URL</label>
                <input type="text" class="form-control" id="url" placeholder="${articulo.picture}">
            </div>
            <div class="form-group">
                <label for="items">Cantidad de items</label>
                <input type="text" class="form-control" id="items" placeholder="${articulo.total_items_in_this_category}">
            </div>
            <div class="form-group row">
                <div class=" d-flex flex-row justify-content-center">
                    <button type="submit" class="btn btn-primary mr-2" @click="agregar(category.finalcategory)">Confirmar</button>
                    <button type="submit" class="btn btn-primary" @click="volverInicio()">Cancelar</button>
                </div>
            </div>
        </form>
    </div>



    <script>

        function volverInicio(){
            location.href= "http://localhost:8084/homework/index";
        }

    </script>
</body>