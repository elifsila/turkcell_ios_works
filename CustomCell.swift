//
//  CustomCell.swift
//  ORDERELLA
//
//  Created by Elif Sıla Okutucu on 12.02.2021.
//

import UIKit
import Alamofire
import SCLAlertView

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var pTitle: UILabel!
    @IBOutlet weak var pImage: UIImageView!
    @IBOutlet weak var pPrice: UILabel!
    
    //@IBOutlet weak var oTitle: UILabel!
    //@IBOutlet weak var oImage: UIImageView!
    //@IBOutlet weak var oPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
