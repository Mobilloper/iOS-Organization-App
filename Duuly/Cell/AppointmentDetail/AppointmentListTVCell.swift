//
//  appointmentListTVCell.swift
//  Duuly
//
//  Created by ACoding on 12/2/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit

class AppointmentListTVCell: UITableViewCell {

    //IBOutlets
    @IBOutlet weak var vAppmtCategory: UIView!
    @IBOutlet weak var lblAppmtTitle: UILabel!
    @IBOutlet weak var lblAppmtStart: UILabel!
    @IBOutlet weak var lblAppmtEnd: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
