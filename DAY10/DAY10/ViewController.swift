//
//  ViewController.swift
//  DAY10
//
//  Created by Elif Sıla Okutucu on 10.02.2021.
//

import UIKit
import Alamofire //artık gövdede kullanabilirsin

class ViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBAction func fncSend(_ sender: UIButton) {
        
        let email = txtEmail.text!
        let pass = txtPass.text!
        
        let params = [ "ref":"5380f5dbcc3b1021f93ab24c3a1aac24", "userEmail":email, "userPass":pass, "face":"no" ]
        
        let url = "https://jsonbulut.com/json/userLogin.php"
        
        
        //Alamofire yapısı;
        AF.request(url, method: .get, parameters: params ).responseJSON { ( res ) in //servis ziyareti sonrası dönen sonuçlar res de sağlanır
            
            //200 dönmesi -> Standart Response for successful HTTP requests control
            if (res.response?.statusCode == 200) {
                //print(res.data!) //dönen data bilgisi kullanma
                
                let userLogin = try? JSONDecoder().decode(UserLogin.self, from: res.data!) // "Serialize" yaptık.
                
                let status = userLogin?.user[0].durum
                let message = userLogin?.user[0].mesaj
                
                if ( status == true ) {
                    //User login success (önceden -> print(message!))
                    self.performSegue(withIdentifier: "product", sender: nil) //buton'dan çekmedik çünkü
                } else {
                    print(message!)
                }
                
            }
            
        }
        
        //product ile işlem yapcaz ama muattap bir sınıf oluşturmak gerekiyor öncelikle.
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

