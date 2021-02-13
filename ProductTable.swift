//
//  ProductTable.swift
//  ORDERELLA
//
//  Created by Elif Sıla Okutucu on 12.02.2021.
//

import UIKit
import Alamofire

class ProductTable: UITableViewController {
    
    var arr: [BilgilerProduct]? = []
    var item: BilgilerProduct!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let params = [ "ref":"5380f5dbcc3b1021f93ab24c3a1aac24", "start":"0" ]
        let url = "https://jsonbulut.com/json/product.php"

        AF.request(url, method: .get, parameters: params ).responseJSON { ( res ) in
            if (res.response?.statusCode == 200) {
                let product = try? JSONDecoder().decode(Products.self, from: res.data!)
                let status = product?.products[0].durum
                let message = product?.products[0].mesaj
                
                if ( status == true ) {
                    //User login success
                    self.arr = product?.products[0].bilgiler
                    self.tableView.reloadData()
                } else {
                    print(message!)
                    
                }
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        let item = arr![indexPath.row]
        cell.pTitle.text = item.productName
        cell.pPrice.text = "\(item.price)₺"
        let url = URL(string: item.images[0].normal)
        let data = try! Data(contentsOf: url!)
        cell.pImage.image = UIImage(data: data)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = arr![indexPath.row]
        performSegue(withIdentifier: "Detail", sender: item)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "Detail" ) {
            let vc = segue.destination as! Detail
            vc.item = sender as? BilgilerProduct
        }
    }
    
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
/*
    //User login success
    self.arr = product?.products[0].bilgiler
    self.tableView.reloadData()
} else {
    print(message!)
     */
}
