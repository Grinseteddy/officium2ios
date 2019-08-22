//
//  SingleTaskCell.swift
//  Officium2
//
//  Created by Annegret Junker on 22.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit

class SingleTaskCell: UITableViewCell {
    
    @IBOutlet weak var taskName: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var dueDate: UILabel!
    
    @IBOutlet weak var progressBarTask: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
