//
//  NoteTableViewCell.swift
//  Nover
//
//  Created by Thao Doan on 1/5/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var exampleTextView: UITextView!
    @IBOutlet weak var typeOfWordLabel: UILabel!
    @IBOutlet weak var newWordLabel: UILabel!
    @IBOutlet weak var tittleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
