//
//  NotesCell.swift
//  Duuly
//
//  Created by ACoding on 12/3/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit

class NotesCell: UITableViewCell {

    @IBOutlet weak var txtvNotes: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtvNotes.placeholder = "Type your Notes Here"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
