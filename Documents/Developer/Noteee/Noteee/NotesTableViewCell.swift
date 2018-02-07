//
//  NotesTableViewCell.swift
//  Noteee
//
//  Created by Thao Doan on 12/28/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import UIKit
import CoreData

class NotesTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backgoundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
