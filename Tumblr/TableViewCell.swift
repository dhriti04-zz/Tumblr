//
//  TableViewCell.swift
//  Tumblr
//
//  Created by Dhriti Chawla on 1/10/18.
//  Copyright © 2018 Dhriti Chawla. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
