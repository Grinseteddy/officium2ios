//
//  TasksTableController.swift
//  Officium2
//
//  Created by Annegret Junker on 22.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit

class TasksTableController: UITableViewController {

    var project: ProjectModel=ProjectModel()
    var tasks: TasksModel=TasksModel()
    
    let backgroundColorsForSection: [UIColor] = [UIColor.gray, UIColor.gray, #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), UIColor.gray]
    
    let tintColorForSection: [UIColor] = [UIColor.darkGray, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.darkGray]
    
    var collapsedForSection: [Bool] = [false, false, false, false, false, false]
    
    override func viewDidLoad() {

        
        super.viewDidLoad()
        self.registerTableViewCells()
        self.setUpNavication();
        
        tasks.loaded=false
        tasks.load(projectId: project.id)
        while (!tasks.loaded) {
            sleep(1)
        }
        
        tasks.sortTasksByStatus()
        
        self.tableView.isEditing = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func setUpNavication() {
        navigationItem.backBarButtonItem?.isEnabled=true
    }

    func registerTableViewCells() {
        let singleTaskCell=UINib(nibName: "SingleTaskCell", bundle: nil)
        self.tableView.register(singleTaskCell, forCellReuseIdentifier: "SingleTaskCell")
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.tasks.sortedByStatus.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeaderView = TaskOverviewSectionHeaderView()
        sectionHeaderView.sectionHeaderLabel.text = tasks.sortedByStatus[section].key
        sectionHeaderView.backgroundColor=backgroundColorsForSection[section]
        sectionHeaderView.sectionHeaderLabel.textColor=tintColorForSection[section]
        sectionHeaderView.collapsed = collapsedForSection[section]
        if collapsedForSection[section] {
            sectionHeaderView.sectionCollapsableButton.setImage(sectionHeaderView.Down, for: .normal)
        } else {
            sectionHeaderView.sectionCollapsableButton.setImage(sectionHeaderView.Right, for: .normal)
        }
        sectionHeaderView.sectionNumber=section
        sectionHeaderView.parent=self
        return sectionHeaderView
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tasks.loaded) {
            if section>=collapsedForSection.count || section<0 {
                return 0
            }
            if collapsedForSection[section] {
                return 0
            }
            return tasks.sortedByStatus[section].tasks.count
        }
        tasks.load(projectId: project.id)
        while (!tasks.loaded) {
            sleep(1)
        }
        if collapsedForSection[section] {
            return 0
        }
        return tasks.sortedByStatus[section].tasks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleTaskCell", for: indexPath) as? SingleTaskCell {
            
            let section = self.tasks.sortedByStatus[indexPath.section]
            let task = section.tasks[indexPath.row]
            
            cell.task=task
            cell.setContent()
            
            return cell
        }

        return UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */


    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let task:TaskModel=tasks.sortedByStatus[fromIndexPath.section].tasks[fromIndexPath.row]
        task.status=tasks.sortedByStatus[to.section].key
        tasks.sortTasksByStatus()
        self.tableView.reloadData()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showSingleTask", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSingleTask" {
           if let indexPath = tableView.indexPathForSelectedRow {
                let task: TaskModel = tasks.sortedByStatus[indexPath.section].tasks[indexPath.row]
            
                let controller=segue.destination as! SingleTaskViewController
                controller.task = task
                controller.project=self.project
                controller.setContent()
                controller.navigationItem.leftItemsSupplementBackButton=true
            

            }
        }
    }
 }
