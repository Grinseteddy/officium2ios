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
        return 80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleTaskCell", for: indexPath) as? SingleTaskCell {
            
            cell.taskNameLabel.text=tasks.tasks[indexPath.row].name
            cell.dueDateLabel.text=tasks.tasks[indexPath.row].duedate
            
            let progressBar: DayProgressView = cell.progressBar as! DayProgressView
            
            progressBar.startDate=tasks.tasks[indexPath.row].createdAt!
            progressBar.endDate=tasks.tasks[indexPath.row].duedate!
            progressBar.awakeFromNib()
            
            return cell
        }

        // Configure the cell...
        
        //ToDo calcluate progress
        //ToDo Select user picture
        
        
        
        /*if ((tasks.tasks[indexPath.row].duedate) != nil) {
            cell.dueDateLable.text=tasks.tasks[indexPath.row].duedate
        }*/
        
        //cell.taskProgressBar.progress = 0.2
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
