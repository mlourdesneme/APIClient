<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:link rel="icon" href="meli.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>
    <header>
        <nav class="navbar nav navbar-expand-lg navbar-light d-flex flex-row justify-content-center w-100">
            <div style="width: 50%;">
                <a class="navbar-brand" href="#"><asset:image class="imgheader" src="mercadoLibre_logo.png" alt="Grails Logo"
                                                              style="width: 50%;"/>
                </a>
            </div>

            <div style="width: 50%;">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto w-100 justify-content-end">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Categorias <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://www.mercadolibre.com.ar" target="_blank">Mercado Libre</a>
                        </li>
                    </ul>

                </div></div>

        </nav>
    </header>

    <g:layoutBody/>

    <!-- Footer -->
    <footer class="footer page-footer fixed-bottom  font-small blue pt-4">

        <!-- Footer Links -->
        <div class="container-fluid text-center text-md-left">

            <!-- Grid row -->
            <div class="row justify-content-center ">

                <!-- Grid column -->
                <div class="col-md-6 mt-md-0 mt-3">

                    <!-- Content -->
                    <h5 class="text-uppercase text-center">DESCRIPCION</h5>
                    <p class="text-justify">Se permite visualizar las diferentes categorias disponibles por país, como asi tambien las
                    subcategorias correspondientes, en caso de no existir se muestra el detalle de la ultima existente.</p>

                </div>
                <!-- Grid column -->

                <hr class="clearfix w-100 d-md-none pb-3">

            </div>
            <!-- Grid row -->

        </div>
        <!-- Footer Links -->

        <!-- Copyright -->
        <div class="footer-copyright text-center py-3">© 2019 Copyright:
            <a href="https://linkedin.com/in/maría-lourdes-neme-26643614b" target="_blank">Maria Lourdes Neme </a>
        </div>
        <!-- Copyright -->

    </footer>
    <!-- Footer -->

</body>