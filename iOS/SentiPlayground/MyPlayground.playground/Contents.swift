import UIKit

//struct class - 기능 집합

struct A {
    var id :String? //상속X
}

struct AA : A {
 
}

class B {
    var a = 10 //상속
    func aaaa() {
        
    }
}

class C : B {
    
}

var strA = A() //값을 복사 - 10 20 > 10
var clsB = B() //참조 - 10 20 > 20

var strAA = strA
var clsBB = clsB

