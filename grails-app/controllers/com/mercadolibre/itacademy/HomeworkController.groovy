package com.mercadolibre.itacademy

import grails.converters.JSON
import groovy.json.JsonSlurper

import javax.net.ssl.HttpsURLConnection

class HomeworkController {

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
        String urlS = "http://localhost:8080/articulos/"+id;
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

    def edit(String id){
        String urlS = "http://localhost:8080/articulos/"+id;
        def url = new URL(urlS)
        def connection = (HttpURLConnection)url.openConnection()
        connection.setRequestMethod("GET")

        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")

        JsonSlurper json = new JsonSlurper()

        def articulo = json.parse(connection.getInputStream())

        [articulo: articulo]

    }

}
