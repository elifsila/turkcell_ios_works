//
//  ViewController.swift
//  DAY8
//
//  Created by Elif Sıla Okutucu on 9.02.2021.
//

import UIKit
import AVFoundation
import WebKit

class ViewController: UIViewController {
    
    var soundPlayer: AVAudioPlayer! //initilize etmek gerekiyor.
    @IBOutlet weak var ImageView: UIImageView! //nesne oldu (action özelliği yok)
    @IBOutlet weak var webView: WKWebView! //import WebKit yap.
    
    @IBAction func btnPlay(_ sender: UIButton) {
        soundPlayer.play()
    }
    @IBAction func btnPause(_ sender: UIButton) {
        soundPlayer.stop()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for locale mp3
        /*
        let path = Bundle.main.path(forResource: "muzik", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        soundPlayer = try! AVAudioPlayer(contentsOf: url)
         */
        
        // for web mp3
        DispatchQueue.main.async {
            let webString = "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_5MG.mp3"
            let webUrl = URL(string: webString)
            self.soundPlayer = try! AVAudioPlayer(data: Data(contentsOf: webUrl!))
        }
        
        //let imgStringUrl = "http://www.myhouseotel.com/uploads/images/set_001fName_20180306105510299.jpg"
        //let url = URL(string: imgStringUrl)
        //let data = try! Data(contentsOf: url!)
        //ImageView.image = UIImage(data: data)
        
        DispatchQueue.main.async {
            let imgStringUrl = "https://images.adsttc.com/media/images/5e1d/02c3/3312/fd58/9c00/06e9/large_jpg/NewHouse_SA_Photo_01.jpg"
            let url = URL(string: imgStringUrl)
            let data = try! Data(contentsOf: url!)
            self.ImageView.alpha = 0 //
            self.ImageView.image = UIImage(data: data, scale: 0.1)
            
            UIView.animate(withDuration: 1.0) {
                self.ImageView.alpha = 1.0
            }
            
        }
        
        // UIView.animate(withDuration: 1.0) {
          //  self.ImageView.alpha = 1.0
        //}
        
        // sayfamızda bir video gösterimi sağlayacağız. ("AVKit Player View Controller" storyboard da)
        // youtube embed video show yapacağız. (ama biz "WebKit View" ekleyeceğiz storyboard a )
        // youtube embed video show (çift tırnaklar tek tırnak yapıldı içinde)
        
        //önceki bekleyicilerden etkilenmeden (video, vs) farklı parçacık olarak gecikmeden koşma için: DispatchQueue.main.async { kullan!!

        DispatchQueue.main.async {
            let embed = "<!doctype html> <html> <head> <meta charset='utf-8'> <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'> <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> </head> <body> <div class='embed-responsive embed-responsive-16by9'> <iframe class='embed-responsive-item' src='https://www.youtube.com/embed/2CHXBMwxRWA?rel=0' allowfullscreen></iframe> </div> </body> </html>"
            //içerde boyut değişikliği yapıldı. (hoca yaptı)
            self.webView.loadHTMLString(embed, baseURL: nil) //içerde tanıtmak için
            
        }
        
    }
/*
    override func viewDidAppear(_ animated: Bool) {
        
        //önceki bekleyicilerden etkilenmeden (video, vs) farklı parçacık olarak gecikmeden koşma için:
        
        UIView.animate(withDuration: 1.0){
            //burada timeinterval türü nesne (1.0) ve animasyonda süre içerisinde yapılacak işlem (alpha->1 in 1 sec)
            self.ImageView.alpha = 1.0
        }
    
    }
*/
}
