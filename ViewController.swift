//
//  ViewController.swift
//  ORDERELLA
//
//  Created by Elif Sıla Okutucu on 11.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imglogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "dashboard", sender: nil)
        }
        
    }
}

