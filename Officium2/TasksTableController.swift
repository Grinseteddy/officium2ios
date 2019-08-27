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

    override func viewDidLoad() {

        
        super.viewDidLoad()
        self.registerTableViewCells()
        self.setUpNavication();
        
        tasks.loaded=false
        tasks.load(projectId: project.id)
        while (!tasks.loaded) {
            sleep(1)
        }

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tasks.loaded) {
            return tasks.tasks.count
        }
        tasks.load(projectId: project.id)
        while (!tasks.loaded) {
            sleep(1)
        }
        return tasks.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleTaskCell", for: indexPath) as? SingleTaskCell {
            
            cell.task=tasks.tasks[indexPath.row]
            cell.setContent()
            
            return cell
        }

        return UITableViewCell()
        
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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

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
                let task: TaskModel = tasks.tasks[indexPath.row]
                    /*let controller = (segue.destination as! UINavigationController).topViewController as! SingleTaskViewController
                    controller.title = task.name
                    controller.task=task
                controller.navigationItem.leftItemsSupplementBackButton=true*/
            
                let controller=segue.destination as! SingleTaskViewController
                controller.task = task
                controller.project=self.project
                controller.setContent()
                controller.navigationItem.leftItemsSupplementBackButton=true
            

            }
        }
        
        
        
    }
 

}
