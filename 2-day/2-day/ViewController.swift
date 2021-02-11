//
//  ViewController.swift
//  2-day
//
//  Created by Elif Sıla Okutucu on 5.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
   // String[] arr = {"ali", "veli", "hasan", "ayşe" };  --> hatalı
    //string türünde bir dizi oluştur;   (Any: bir tyoe türü)
    var names:[Any] = ["ali", "veli", "hasan", "ayşe", 10, true, 10.1 ]

    
    @IBOutlet weak var txtData:
        UITextField!
    
    @IBAction func fncDataAdd(_ sender: UIButton) {
        let txt = txtData.text
        names.append(txt!)
        
        forLoop()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // aşağıda func call ile çağırsaydık miras alınan sınıfın özünü çağır (UIViewController içindeki özelliği işaret ettik.)
        print("ViewDidLoad Call")   // Do any additional setup after loading the view.
        
        //let - var
        let number1 = 10   //print("Number1 : \(number1)")
        let write = "Number1 : \(number1)"
        print(write)
        
        var number2 = 20
        number2 = 21
        print(number2)
        
        let number3:Int = 30
        print(number3)
        
        let status = true
        
        let name = "Ali"
        
        let number4:Float = 10.5
        
        //Tür dönüşümü örneği
        let stNumber1 = Int("50") ?? 0          //denetim için ?? 0 kondu
        let stNumber2 = Int("80") ?? 0
        let sum = stNumber1 + stNumber2        // !: sayısal tür geliyo der
        print("Sum : \(sum)")
        
        //bir denetim örneği daha
        if let stNumber3 = Int("veli"), let stNumber4 = Int("90") {
            let sumx = stNumber3 + stNumber4
            print("Sumx : \(sumx)")
        }else {
            print("Number Format Fail!")
        }
        
        let dNumber = 10.9
        let cDNumber = Int(dNumber)
        print("cDNumber : \(cDNumber)") //ondalık değeri integer a dönüştür
        
        //Array using
        print(names[0]) //0. elemana gittik
        }
    
        func forLoop()
        {
            for item in names {
                print(item) //elemanları ayrı ayrı tanımladık
        }
        
    
    }
    
    override func viewDidAppear(_ animated: Bool){
        //viewDidLoad()
        print("ViewDidAppear Call")
    }

        
}
    


