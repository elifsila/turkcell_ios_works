//
//  ProductTable.swift
//  HW4
//
//  Created by Elif Sıla Okutucu on 10.02.2021.
//

import UIKit

class ProductTable: UITableViewController {
    
    let db = DB()
    var arr:[ProductSt] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        db.fncConnection()
        arr = db.productList() //array gövdesini artık doldurabilirsin

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = arr[indexPath.row] //n. elemana ulaşmak için ilgili satırda dönen elemanı burda yakalamalı.
        //Dataları serpiştir;
        cell.textLabel?.text = item.product

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true //"Her satır sizin için editlenmeye uygundur. "
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { // user list'e eklenmiş öğe silme tuşunu çıkarır
            // Delete the row from the data source
            let item = arr[indexPath.row] // indexPath.row'uncu eleman silinmeye çalışılıyor;
            // Bunun için DB.swift e geç. Ordaki işten sonra; (DB.swift 83.satır)
            let deleteRow = db.productDelete(uid: item.id)
            if ( deleteRow > 0 ) {
                arr.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade) //index path'e ulaşıp datayı ortadan kaldırır.
                //burda veri tabanından sildik ama yukarıdaki tabloda hala data var, o da kalkmalı.
                //ondan bu ifadenin üstünde arr.remove dedik.
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = arr[indexPath.row]
        print(item.product)
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

}
