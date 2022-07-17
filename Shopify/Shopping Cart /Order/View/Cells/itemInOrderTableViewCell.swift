//
//  itemInOrderTableViewCell.swift
//  Shopify
//
//  Created by Macintosh on 15/07/2022.
//

import UIKit

class itemInOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var imageItem: UIImageView!
    
    @IBOutlet weak var numOfItemLbl: UILabel!
    @IBOutlet weak var itempriceLbl: UILabel!
    @IBOutlet weak var itemTitleLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
