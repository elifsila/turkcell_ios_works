//
//  Detail.swift
//  ORDERELLA
//
//  Created by Elif Sıla Okutucu on 12.02.2021.
//

import UIKit
import Alamofire
import SCLAlertView

class Detail: UIViewController {
    
    var order: [OrderListElement]? = []
    var item: BilgilerProduct!
        
    @IBOutlet weak var dTitle: UILabel!
    @IBOutlet weak var dImage: UIImageView!
    @IBOutlet weak var dInfo: UITextView!
    @IBOutlet weak var dPrice: UILabel!
    @IBAction func btnOrder(_ sender: UIButton) {
        
        let customerId = UserDefaults.standard.string(forKey: "userID")
        let productId = item.productID
        print(productId)
        print("customerId" as Any)
        
        let params = [ "ref":"5380f5dbcc3b1021f93ab24c3a1aac24", "customerId": customerId, "productId": productId, "html": productId]
        let url = "https://jsonbulut.com/json/orderForm.php"
        AF.request(url, method: .get, parameters: params ).responseJSON { (res) in
            print(res)
            if (res.response?.statusCode == 200) {
                
                //let str = String(decoding: res.data!, as: UTF8.self)
                let ordergive = try? JSONDecoder().decode(Orders.self, from: res.data!)
                let status = ordergive?.order[0].durum
                let message = ordergive?.order[0].mesaj
                
                if ( status == true ) {
                    SCLAlertView().showSuccess("Order Succeeded!", subTitle: "Your order has been received.", closeButtonTitle: "Done")
                } else {
                    print(message!)
                    //SCLAlertView().showError("Warning!", subTitle: "Your order has been failed.", closeButtonTitle: "Done")
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dTitle.text = item.productName
        dPrice.text = "\(item.price)₺"
        dInfo.text = item.bilgilerProductDescription
        let url = URL(string: item.images[0].normal)
        let data = try! Data(contentsOf: url!)
        dImage.image = UIImage(data: data)
    }
}
