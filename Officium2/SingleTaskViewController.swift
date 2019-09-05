//
//  SingleTaskViewController.swift
//  Officium2
//
//  Created by Annegret Junker on 27.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit

class SingleTaskViewController: UIViewController {

    var task: TaskModel=TaskModel()
    var project: ProjectModel=ProjectModel()
    var assignee: UserManagement=UserManagement()
    var updatedBy: UserManagement=UserManagement()
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var assigneeLabel: UILabel!
    
    @IBOutlet weak var labelLastUpdate: UILabel!
    
    @IBOutlet weak var labelLastUpdateBy: UILabel!
    
    
    @IBOutlet weak var singleTaskTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContent()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //setContent()
    }
    
    func setContent() {
        if (statusLabel == nil || dueDateLabel == nil || taskNameLabel == nil || assigneeLabel == nil || assigneeLabel == nil || labelLastUpdateBy == nil || labelLastUpdate == nil ) {
            return
        }
        getAssigneeById()
        getUpdatedById()
        self.statusLabel.text=self.task.status
        self.dueDateLabel.text=self.task.duedate!
        self.taskNameLabel.text=self.task.name
        self.assigneeLabel.text=self.assignee.assignee.user!.surname + " " + self.assignee.assignee.user!.name
        self.labelLastUpdate.text=self.task.updatedAt
        self.labelLastUpdateBy.text=self.updatedBy.updatedBy.user!.surname + " " + self.updatedBy.updatedBy.user!.name
        self.singleTaskTitle.title=self.task.name
    }
    
    func getAssigneeById() {
        if (assignee.assigneeloaded) {
            return
        }
        assignee.getUserById(assigneeId: self.task.assignee)
        while (!assignee.assigneeloaded) {
            sleep(1)
        }
    }
    
    func getUpdatedById() {
        if (updatedBy.updatedByLoaded) {
            return
        }
        updatedBy.getUpdatedById(updatedById: self.task.updatedBy)
        while (!updatedBy.updatedByLoaded) {
            sleep(1)
        }
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showTasksAgain") {
            let controller = (segue.destination as! UINavigationController).topViewController as! TasksTableController
            controller.title = self.project.name
            controller.project=self.project
            controller.navigationItem.leftItemsSupplementBackButton=true
        }
        
        
    }
    

}
