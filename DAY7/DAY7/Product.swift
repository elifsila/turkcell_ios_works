//
//  Product.swift
//  DAY7
//
//  Created by Elif Sıla Okutucu on 8.02.2021.
//

import UIKit

class Product: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Product viewDidLoad Call")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("Product viewDidAppear Call") //Life cycle (her o sayfaya geldiğimiz an için)
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
