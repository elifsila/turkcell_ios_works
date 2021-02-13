//
//  RegisterController.swift
//  ORDERELLA
//
//  Created by Elif Sıla Okutucu on 11.02.2021.
//

import UIKit
import Alamofire
import SCLAlertView

class RegisterController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBAction func fncSend(_ sender: Any) {
        let name = txtName.text!
        let surname = txtSurname.text!
        let phone = txtPhone.text!
        let mail = txtMail.text!
        let pass = txtPass.text!
        
        let params = [ "ref":"5380f5dbcc3b1021f93ab24c3a1aac24", "userName":name, "userSurname":surname, "userPhone":phone, "userMail":mail, "userPass":pass ]
        
        let url = "https://jsonbulut.com/json/userRegister.php?"
        
        AF.request(url, method: .get, parameters: params ).responseJSON { ( res ) in

            if (res.response?.statusCode == 200) {
                let userRegister = try? JSONDecoder().decode(UserRegister.self, from: res.data!)
                let status = userRegister?.us[0].durum
                let message = userRegister?.us[0].mesaj
                
                if ( status == true ) {
                    //User register success
                    //self.performSegue(withIdentifier: "product", sender: nil)
                    let userID = userRegister?.us[0].kullaniciID
                    UserDefaults.standard.setValue(userID, forKey: "userID")
                    SCLAlertView().showSuccess("Registration succeeded!", subTitle: message!, closeButtonTitle: "Done")
                } else {
                    print(message!)
                    //SCLAlertView().showError("Warning!", subTitle: "Registration failed!", closeButtonTitle: "Done")
                }
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
