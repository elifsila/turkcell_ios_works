//
//  ProductTable.swift
//  DAY10
//
//  Created by Elif Sıla Okutucu on 11.02.2021.
//

import UIKit
import Alamofire

// BU KISIM İÇİN TEKRAR JSON SAYFASINDA -> ÜRÜNLER KISMINA GİTTİK.

class ProductTable: UITableViewController {
    
    var arr: [BilgilerProduct]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Alamofire_5 kulağından tut getir, içteki verileri ürünler linkine göre düzelt;
        let params = [ "ref":"5380f5dbcc3b1021f93ab24c3a1aac24", "start":"0" ]
        
        let url = "http://jsonbulut.com/json/product.php"

        //Alamofire yapısı;
        AF.request(url, method: .get, parameters: params ).responseJSON { ( res ) in //servis ziyareti sonrası dönen sonuçlar res de sağlanır
            
            //200 dönmesi -> Standart Response for successful HTTP requests control
            if (res.response?.statusCode == 200) {
                //print(res.data!) //dönen data bilgisi kullanma
                
                let product = try? JSONDecoder().decode(Products.self, from: res.data!) // "Serialize" yaptık.
                
                let status = product?.products[0].durum
                let message = product?.products[0].mesaj
                
                if ( status == true ) {
                    //User login success
                    //ürünler bilgisine nasıl ulaşırız;
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let item = arr![indexPath.row]
        cell.textLabel?.text = item.productName
        //burda resimlerle gelen datadan bahsedecektik.
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

}
