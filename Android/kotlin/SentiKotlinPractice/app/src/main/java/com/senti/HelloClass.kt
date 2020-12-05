package com.senti

fun main() {

    //유사 기능들(함수)의 집합체(객체)

    //1. class - 자동차(시동, 운전), 사람(밥먹는다, 물마신다, 걷는다), 동물(뛴다~), 식물(자란다~)
    //2. data class - set, get

    //1. 코딩
    //2. 호출

    var cls = HelloClass()
    var cls2 = HelloClass(10)

    //java
    //HelloClass cls = new HelloClass()

    println(cls2.age)

    var person = Person(5,"Senti")

    println(person.name)

}

class HelloClass {
    var age: Int = 0

//    init {
//        age = 0
//    }
//
    //def 생성자, 보조 생성자
    constructor() //기본 생성자
    constructor(age: Int) { //set
        this.age = age
    }//보조 생성자
}

data class Person(var age:Int, val name:String)
