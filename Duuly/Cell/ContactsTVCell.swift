//
//  ContactCellTableViewCell.swift
//  Duuly
//
//  Created by ACoding on 12/1/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit

class ContactsTVCell: UITableViewCell {

    @IBOutlet weak var imgvUserPhoto: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgvUserPhoto.layer.cornerRadius = imgvUserPhoto.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
