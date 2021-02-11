//
//  ViewController.swift
//  HW4
//
//  Created by Elif Sıla Okutucu on 10.02.2021.
//

import UIKit
import SCLAlertView

class ViewController: UIViewController {
    
    let db = DB()
    var row:[Int] = []
    var temp:Int = 0
    
    @IBOutlet weak var txtProduct: UITextField!
    @IBOutlet weak var txtNumber: UITextField!
    @IBAction func btnAdd(_ sender: UIButton) {
        let product = txtProduct.text!
        let number = txtNumber.text!
        //insert
        self.temp = Int(db.productInsert(product: product, number: number))
        self.row.append(temp)
    
        print(row)
        
        SCLAlertView().showInfo("Ürününüz kaydedildi", subTitle: "Lütfen yeni bir ürün giriniz")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db.fncConnection()
    }
}

