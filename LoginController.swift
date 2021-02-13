//
//  LoginController.swift
//  ORDERELLA
//
//  Created by Elif Sıla Okutucu on 11.02.2021.
//

import UIKit
import Alamofire

class LoginController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBAction func fncSend(_ sender: UIButton) {
        let email = txtEmail.text!
        let pass = txtPass.text!
        
        let params = [ "ref":"5380f5dbcc3b1021f93ab24c3a1aac24", "userEmail":email, "userPass":pass, "face":"no" ]
        
        let url = "https://jsonbulut.com/json/userLogin.php"

        AF.request(url, method: .get, parameters: params ).responseJSON { ( res ) in
            if (res.response?.statusCode == 200) {
                let userLogin = try? JSONDecoder().decode(UserLogin.self, from: res.data!)
                let status = userLogin?.user[0].durum
                let message = userLogin?.user[0].mesaj
                
                if ( status == true ) {
                    let userID = userLogin?.user[0].bilgiler?.userID
                    UserDefaults.standard.setValue(userID, forKey: "userID")
                    self.performSegue(withIdentifier: "product", sender: nil)
                    print("Succesful Login!")
                } else {
                    print(message!)
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
