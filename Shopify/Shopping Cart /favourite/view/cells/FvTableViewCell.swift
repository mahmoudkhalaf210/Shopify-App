//
//  FvTableViewCell.swift
//  Shopify
//
//  Created by Macintosh on 16/07/2022.
//

import UIKit

class FvTableViewCell: UITableViewCell {

    @IBOutlet weak var PriceOfProduct: UILabel!
    @IBOutlet weak var titleOfProduct: UILabel!
    @IBOutlet weak var imageOfProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
