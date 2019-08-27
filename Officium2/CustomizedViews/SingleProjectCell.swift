//
//  SingleProjectCell.swift
//  Officium2
//
//  Created by Annegret Junker on 26.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit

class SingleProjectCell: UITableViewCell {
    
    @IBOutlet weak var projectIcon: UIImageView!
    
    @IBOutlet weak var projectNameLabel: UILabel!
    
    @IBOutlet weak var projectProgress: DayProgressView!
    
    var project: ProjectModel?
    
    //ToDo Select User Picture
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }*/
    
    func setContent() {
        if (projectIcon == nil || projectNameLabel == nil || projectProgress == nil) {
            awakeFromNib()
        }
        if ((project) != nil) {
            projectNameLabel.text=project!.name
            projectProgress.startDate=project!.createdAt!
            projectProgress.endDate=project!.dueDate!
            projectProgress.calculateProgress()
            projectProgress.awakeFromNib()
        }
        
    }

}
