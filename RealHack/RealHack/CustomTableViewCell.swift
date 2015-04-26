//
//  CustomTableViewCell.swift
//  RealHack
//
//  Created by Asif Junaid on 4/26/15.
//
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOutlet: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var title1: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
