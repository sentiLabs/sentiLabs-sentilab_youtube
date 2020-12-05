package com.senti

fun main() {
    val hello1 = "hello world1"
    var hello2: String = "world2" //null  - String hello2 = null; //swift
    var hello3: String? = "world3"

    println(hello1)
    println(hello1)

    println(hello())

}

fun hello(): String { //void // private void hello() {} private String hello() {}
    return "hello fun!"
}

