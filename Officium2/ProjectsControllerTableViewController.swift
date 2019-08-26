//
//  ProjectsControllerTableViewController.swift
//  Officium2
//
//  Created by Annegret Junker on 21.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit


class ProjectsControllerTableViewController: UITableViewController {
    
    var projects: ProjectsModel=ProjectsModel()

    override func viewDidLoad() {
        projects.load()
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title="Projects"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if projects.loaded {
            return projects.projects.count
        }
        projects.load()
        while (!projects.loaded) {
            sleep(1)
        }
        return projects.projects.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTasksOfProject" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let project: ProjectModel
                project=projects.projects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! TasksTableController
                controller.title = project.name
                controller.project=project
                controller.navigationItem.leftItemsSupplementBackButton=true
                
            }
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleProjectCell", for: indexPath) as! SingleProjectTableViewCell

        cell.projectName.text=projects.projects[indexPath.row].name
        
        let progressBar: DayProgressView = cell.progressBar as! DayProgressView;
        
        progressBar.startDate=projects.projects[indexPath.row].createdAt!;
        progressBar.endDate=projects.projects[indexPath.row].dueDate!;
        progressBar.awakeFromNib()
        
        //ToDo add icon to project
        //ToDo show icon

        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }*/
    
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
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
