package com.mercadolibre.itacademy

import grails.converters.JSON
import groovy.json.JsonSlurper

import javax.net.ssl.HttpsURLConnection

class HomeworkController {

    String idArt ="";
    String idMarca=""

    def index() {

        def url = new URL("http://localhost:8080/marcas")
        def connection = (HttpURLConnection)url.openConnection()
        connection.setRequestMethod("GET")

        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")

        JsonSlurper json = new JsonSlurper()

        def sites = json.parse(connection.getInputStream())

        [sites:sites]

    }

    def selectCategory(String id){

        def url = new URL("http://localhost:8080/marcas/"+id+"/articulos")
        def connection = (HttpURLConnection)url.openConnection()
        connection.setRequestMethod("GET")

        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")

        JsonSlurper json = new JsonSlurper()

        def categories = json.parse(connection.getInputStream())

        def resultado = [categories:categories]

        render resultado as JSON

    }

    def selectSubCategory(String id){
        String urlS = ("http://localhost:8080/articulos/"+id);
        def url = new URL(urlS)
        def connection = (HttpURLConnection)url.openConnection()
        connection.setRequestMethod("GET")

        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")

        JsonSlurper json = new JsonSlurper()

        def subcategories = json.parse(connection.getInputStream())

        def resultado = [subcategories:subcategories]

        render resultado as JSON

    }

    def create(){
        idMarca = getParams().get("id")
        render(view: 'create')
    }

    def createArt(String articulo){
        String urlS = ("http://localhost:8080/marcas/" + idMarca + "/articulos");

        println (articulo)
        def url = new URL(urlS)
        def connection = (HttpURLConnection)url.openConnection()


        connection.setDoOutput(true)//envio info
        connection.setDoInput(true)//recibo info

        connection.setRequestMethod("POST")
        connection.setRequestProperty("Content-Type", "application/json")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")

        //mandó lo que leí
        OutputStreamWriter info= new OutputStreamWriter(connection.getOutputStream())
        info.write(articulo) //indico que enviar
        info.flush() //envio la info

        connection.getInputStream()
        println("hola")

        render( view: 'index')

    }

    def edit(String id)
    {
        idArt= getParams().get("id")
        render view: 'edit'
    }

    def editArt(String articulo){
        String urlS = ("http://localhost:8080/articulos/"+idArt);
        def url = new URL(urlS)
        def connection = (HttpURLConnection)url.openConnection()

        connection.setDoOutput(true)//envio info
        connection.setDoInput(true)//recibo info

        connection.setRequestMethod("PUT")
        connection.setRequestProperty("Content-Type", "application/json")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")

        //mandó lo que leí
        OutputStreamWriter info= new OutputStreamWriter(connection.getOutputStream())
        info.write(articulo) //indico que enviar
        info.flush() //envio la info

        connection.getInputStream()
        println("hola")

        render( view: 'index')
    }



    def delete(String id){
        String urlS = ("http://localhost:8080/articulos/"+id);
        def url = new URL(urlS)
        def connection = (HttpURLConnection)url.openConnection()
        connection.setRequestMethod("DELETE")

        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")

        //para abrir conexion
        connection.getInputStream()


    }

}
