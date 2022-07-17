//
//  OrderTableViewCell.swift
//  Shopify
//
//  Created by Macintosh on 15/07/2022.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    @IBOutlet weak var TotalPriceLbl: UILabel!
    @IBOutlet weak var createdAtLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
