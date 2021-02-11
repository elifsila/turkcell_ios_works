//
//  Settings.swift
//  3-Day
//
//  Created by Elif Sıla Okutucu on 7.01.2021.
//

import Foundation

class Settings {
    
    var name = ""
    var number = 0
    
    init() { // viewController da direk Settings() çağırılır.
        
    }
    
    //initializing
    init( name:String, number:Int ) {  //constructure parametre alıyor
        self.name = name //sınıf içineki name'i constructer içinde gelenle change et
        self.number = number //sınıf içineki number'ı constructer içinde gelenle change et
        
    }
    
    func call() {
        print("Data: ", name, " ", number)
    }
    
}
