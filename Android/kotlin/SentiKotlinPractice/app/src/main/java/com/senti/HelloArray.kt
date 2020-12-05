package com.senti

fun main() {
    //1. 배열
    //2. loop 반복
    //3. 캐스팅 (가볍게)

    //1. 배열 = {"","",""}
    var arr1 = listOf("1","2") //ArrayList <= 넣고 빼고 "수정"
    var arr2 = mutableListOf("1","2")

    //2. 반복문 (향상된 반복문)
    for(item in arr1) {
        println(item)
    }
    for((index, item) in arr2.withIndex()) {
        println("$index, $item")
    }

    //3. casting object < String, int, long..... // Any - auto casting
    var hello: Any = "hello"
    if(hello is String) {
        var str: String = hello
    }
}