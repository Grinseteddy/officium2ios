//
//  SingleProjectTableViewCell.swift
//  Officium2
//
//  Created by Annegret Junker on 22.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit

class SingleProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var projectIcon: UIImageView!
    
    @IBOutlet weak var projectName: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.projectName.text="Project just initialized"
        self.progressBar.progress=0.1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
