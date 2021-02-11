//
//  AppDelegate.swift
//  DAY11
//
//  Created by Elif Sıla Okutucu on 11.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    let notification = UNUserNotificationCenter.current()
    static var notiStatus = false

    //kullanıcı uygulamaya ilk bastığı an burası çalışır.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //bildiri izinleri burada olacak.
        
        //notification açıldıktan sonra yapılacak olan unsurları çalıştırma;
        notification.delegate = self
        //izinleri alıyoruz;
        notification.requestAuthorization(options: [.alert, .badge, .sound]) { (status, error) in
            
            if ( status == true ){
                print("status", status)
                AppDelegate.notiStatus = true
            } else {
                //print("status", (error?.localizedDescription)!)
                print("Notification Permission False")
                //notification izni yoksa kullanıcıyı ayarlar'a yönlendir.
            }
            
        }
        
        return true
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive Call")
    }
    
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

