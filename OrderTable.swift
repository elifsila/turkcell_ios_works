//
//  OrderTable.swift
//  ORDERELLA
//
//  Created by Elif Sıla Okutucu on 12.02.2021.
//

import UIKit
import Alamofire
import SCLAlertView

class OrderTable: UITableViewController {
    
    var userOrder: [OrderListElement]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customerId = UserDefaults.standard.string(forKey: "userID")
        let params = [ "ref":"5380f5dbcc3b1021f93ab24c3a1aac24", "musterilerID": customerId ]
        let url = "https://jsonbulut.com/json/orderList.php"

        AF.request(url, method: .get, parameters: params ).responseJSON { ( res ) in
            if (res.response?.statusCode == 200) {
                let str = String(decoding: res.data!, as: UTF8.self)
                print(str)
                let orderAr = try? JSONDecoder().decode(OrderList.self, from: res.data!)
                //print(orderAr)
                //let status = product?.products[0].durum
                //let message = product?.products[0].mesaj
                if (orderAr?.orderList![0] != nil) {
                    self.userOrder = orderAr?.orderList![0]
                    self.tableView.reloadData()
                    print("Data Arrived!")
                } else {
                    //print("Error!")
                    SCLAlertView().showError("Warning!", subTitle: "You don't have any order!", closeButtonTitle: "Done")
                    
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
        return userOrder!.count
        //return orderList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        /*
        //let item = userOrder![indexPath.row] (öncesi)
         if let item = userOrder?[indexPath.row] {
             cell.pTitle.text = item.urunAdi
             cell.pPrice.text = "\(item.fiyat)₺"
             let url = URL(string: item.normal!)
             let data = try! Data(contentsOf: url!)
             cell.pImage.image = UIImage(data: data)
         }
         */
        
        if userOrder?[indexPath.row] != nil {
            let item = userOrder?[indexPath.row]
            if item?.urunAdi != nil {
                //print(item?.urunAdi)
                cell.pTitle.text = item?.urunAdi
                cell.pPrice.text = "\(item?.fiyat)₺"
                let url = URL(string: (item?.normal!)!)
                let data = try! Data(contentsOf: url!)
                cell.pImage.image = UIImage(data: data)
            }            
        }
        
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
