package com.senti

fun main() {
    //map - key, value pair JSON name! senti (value) "~","~","~"
    //{"name":"senti"}



    var map1 = mapOf(Pair("name","senti"))

    var map2 = mutableMapOf<String, String>() //type
    map2.put("name","senti")
    map2.put("age", "1")

    //keys
    print(map2.keys)

//    for(map in map2) {
//        println(map.value)
//
//    }

    //nullable, not null

}