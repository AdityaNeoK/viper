//
//  TableViewCell.swift
//  genericNeoProject
//
//  Created by Neosoft on 03/02/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var productCost: UILabel!
    @IBOutlet weak var productProducer: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
