//
//  Util.swift
//  3-Day
//
//  Created by Elif Sıla Okutucu on 7.01.2021.
//

import Foundation

class Util {
    
    var name = "Ali"
    
    func noParameter(){
        let num1 = 40
        let num2 = 80
        let sum = num1 + num2
        print("Sum: \(sum)")
    }
    
    func Parameter( num1:Int, num2:Int ) {
        let sum = num1 + num2
        print("Sum: \(sum)")
    }
    
    func parameterReturn( num1:Int, num2:Int ) -> Int {
        let sum = num1 + num2
        return sum
    }
    
    func parameterReturns( num1:Int, num2:Int ) -> (Int, String) {
        let sum = num1 + num2
        return (sum, "Ali")
    }
    
    
    func StringConcat( name: String, surname: String ) -> String {
        let st = "\(name) \(surname)"
        return st
    }
    
    
    
}
