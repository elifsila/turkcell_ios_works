//
//  ViewController.swift
//  3-Day
//
//  Created by Elif Sıla Okutucu on 7.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var lblName: UILabel!
    @IBAction func btnCall(_ sender: UIButton) {
        
        let name = txtName.text!
        let surname = txtSurname.text!
        let util = Util()
        let st = util.StringConcat(name: name, surname: surname)
        lblName.text = st
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        //object -> new
        //Util ut = new Util()
        let util = Util()
        print(util.name)
        
        //noParameter Call
        util.noParameter()
        
        //parametre almayan foksiyonlar çok elverişli/kullanışlı değil.
        
        //Parameter Call
        util.Parameter(num1: 50, num2: 80)
        util.Parameter(num1: 130, num2: 56)
        
        //returnParameter Call
        let sm = util.parameterReturn(num1: 10, num2: 90)
        if (sm > 150) {
            print("Sm: ", sm)
        }else{
            print("Sum 150!")
        }
        
        
        //parameterReturns
        let fnc = util.parameterReturns(num1: 80, num2: 90)
        print(fnc.0)
        print(fnc.1) //1'den fazla geriye dönüş unsuru var.
        
        
        //var -> Name
        print("=======================================")
        print(util.name)
        util.name = "Ahmet"
        print(util.name)
        
        let utilx = Util() //ilk kurguyu verdi. (Ali verdi)
        print(utilx.name)
        
        let st = Settings(name: "Ahmet", number: 50) //Settings()
        st.call() //call'ı burada tetikledik
        
        //constructer a parametre bekleyecek şekilde aktivite yaparsanız methodun çalışma prensibini etkileyen bir unsur yaratılır
        
        
        var dic = [ "name": "Zehra", "surname": "Bilmem" ] //sıralama önemli değil (dizilerde önemliydi)
        //add item                                           Çünkü key verdiğinde value'yu elde edersin.
        dic["age"] = "35"
        dic["age"] = "36" //35'i pas geçer
        dic["mail"] = "zehra@mail.com"
        dic["city"] = "Ankara"
        
        //delete item
        dic.removeValue(forKey: "mail")
        
        //all key and item data
        for (key, value) in dic {   // (key, value) <-> item
            print(key, value)
        }
        
        
        
        print(dic) //basma sırası kriteri ise hash koduna bakarak en yüksekten en aza göre sıralar(hızlıca)
        
        //STRING LER İLE PROGRAM ÜRETMEYİ HAYATINDAN ÇIKARMALISIN
        
        var dicx = [EUser.name: "Ayşe", EUser.surname: "Bilsin"]
        dicx[EUser.mail] = "ayşe@mail.com"
        dicx[EUser.city] = "İstanbul"  //değerleri yazmadık,seçtik.
        dicx[EUser.age] = "30"
        
        print(dicx[EUser.name]!)
        
        print(dicx)
        

    }
}

