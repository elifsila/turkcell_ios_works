//
//  ViewController.swift
//  5-Days
//
//  Created by Elif Sıla Okutucu on 12.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var txtData: UITextField!
    @IBAction func fncSend(_ sender: UIButton) {
        
        let data = txtData.text!
        let mail_data = mail.text!
        
        
        if ( data == "" ) {
            print("Data not empty!")
            alertForm(title: "Data Error", message: "Data not empty!")
        }else if ( mail_data == "" ) {
            print("Mail not empty!")
            alertForm(title: "Mail Error", message: "Mail not empty!")
        }
        
    }
    
    
    func alertForm( title:String, message: String ) {
        
        // alert init ->title,message,preferredStyle
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        // button create
        let yesBtn = UIAlertAction(title: "Ok", style: .default) { (action) in
            print("Ok Button Click")
        }
        
        // cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(yesBtn) // button add
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil) // show

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

