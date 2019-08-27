//
//  SingleTaskCell.swift
//  Officium2
//
//  Created by Annegret Junker on 23.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit

class SingleTaskCell: UITableViewCell {

    
    @IBOutlet weak var progressBar: DayProgressView!
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    var task: TaskModel=TaskModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        dueDateLabel.text="Due Date"
        taskNameLabel.text="Task Name"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent() {
        progressBar.startDate=self.task.createdAt!
        progressBar.endDate=self.task.duedate!
        progressBar.calculateProgress()
        progressBar.awakeFromNib()
        dueDateLabel.text=self.task.duedate
        taskNameLabel.text=self.task.name
        
    }
    
}
