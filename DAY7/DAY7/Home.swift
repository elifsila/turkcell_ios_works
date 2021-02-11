//
//  Home.swift
//  DAY7
//
//  Created by Elif Sıla Okutucu on 8.02.2021.
//

import UIKit
import SCLAlertView

class Home: UIViewController {
    
   // let names:[Any] = ["ali", "veli", "hasan", "ayşe", 10, true, 10.1 ]     bu sample array
    
    

    @IBAction func fncAlertShow(_ sender: UIButton) {
        SCLAlertView().showInfo("Önemli Uyarı", subTitle: "Lütfen adınızı giriniz!") //closeButtonTitle: "Tamam") //1-uyarı verir, closebuttontitle done ı tamam yapar. Bunu yazmadan yapmak için, default dakini ezmek gerekir.
        
        //SCLAlertView().showWait("Important info", subTitle: "You are great") //2-yükleniyor efekti de verir
        
        /*
        SCLAlertView().showTitle(   // 3-operasyon başarı ile tamamlandı der
            "Congratulations", // Title of view
            subTitle: "Operation successfully completed.", timeout: nil,   // String of view
            completeText: "Done", // Optional button value, default: ""
            style: .success, // Styles - see below.
            colorStyle: 0xA429FF,
            colorTextButton: 0xFFFFFF
        )
         "Bir library yükledik ama özelliklerini dilediğimizce değişik kullanabiliyoruz."
       */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Home viewDidLoad Call")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("Home viewDidAppear Call") //Life cycle (her o sayfaya geldiğimiz an için)
    }

}
