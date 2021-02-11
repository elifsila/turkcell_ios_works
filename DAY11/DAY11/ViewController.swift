//
//  ViewController.swift
//  DAY11
//
//  Created by Elif Sıla Okutucu on 11.02.2021.
//

// Resim: 119, 462,  177,135

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var img: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sonlara doğru geldik buraya animasyon için..
        txtTitle.alpha = 0
        txtDetail.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.txtTitle.alpha = 1
        } completion: { (bool) in
            UIView.animate(withDuration: 0.4) {
                self.txtDetail.alpha = 1
            }
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.8, options: .allowAnimatedContent, animations: {
            self.img.frame = CGRect(x: 119, y: 462, width: 177, height: 135)
        }, completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print(AppDelegate.notiStatus)
        
        //Önce appdelegate ile kontrol et kullanıcı bildirimlere onay vermiş mi diye, vermediyse ayarlar'a yönlendir
        if ( AppDelegate.notiStatus == false ) {
            let alert = UIAlertController(title: "Warning", message: "Notification Permission Error", preferredStyle: .alert)
            let gotoSettings = UIAlertAction(title: "Goto Settings", style: .default) { (action) in
                //UIApplication.shared.open(URL(string: "App-Prefs:root=NOTIFICATIONS_ID")!, options: [:], completionHandler: nil)  (1)
                if let bundleIdentifier = Bundle.main.bundleIdentifier, let appSettings = URL(string: UIApplication.openSettingsURLString + bundleIdentifier) {
                    if UIApplication.shared.canOpenURL(appSettings) {
                        UIApplication.shared.open(appSettings)
                    }
                }

            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(gotoSettings)
            alert.addAction(cancel)
            
            //Alert'ü göster
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDetail: UITextField!
    //weak formatta datepicker çekmiştik vurda onu kapadık.
    var timeNow: TimeInterval = 0
    @IBAction func fncChange(_ sender: UIDatePicker) { //kullanıcı tarih değiştiricek
        timeNow = sender.date.timeIntervalSinceNow
        print(sender.date)
    }
    
    @IBAction func fncCreate(_ sender: UIButton) {
        
        if ( AppDelegate.notiStatus == true ) {
            
            let title = txtTitle.text!
            let detail = txtDetail.text!
            
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = detail
            content.badge = 1 // bange: rozet
            
            //time (notification gelme zamanı)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeNow, repeats: false)
            
            //request
            let req = UNNotificationRequest(identifier: "remember_notification", content: content, trigger: trigger)
            
            //add (notification'u artık çalıştır)
            UNUserNotificationCenter.current().add(req, withCompletionHandler: nil )
            
        }
        
        
    }
    
    
    

}

