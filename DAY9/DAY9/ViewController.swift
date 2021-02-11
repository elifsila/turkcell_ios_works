//
//  ViewController.swift
//  DAY9
//
//  Created by Elif Sıla Okutucu on 9.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let db = DB()
    
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBAction func btnAdd(_ sender: UIButton) {
        
        let name = txtName.text!
        let email = txtEmail.text!
        //insert
        let row = db.userInsert(name: name, email: email)
        print(row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //db nesnesine geldiğimizde önce fncConnection() tetiklenmeli yoksa initilize olmaz!
        // ondan sonra db içine insert atabiliriz.
        db.fncConnection()
        
        //insert
        //let row = db.userInsert(name: "Ali Bilmem", email: "ali@ali.com") [1]
        //select
        //db.userList()//bunu tetikleyip bir dizi görmek isteriz -> STRUCK kurucaz!(DB de yukarıda)
    }


}

