//
//  TasksModel.swift
//  Officium2
//
//  Created by Annegret Junker on 22.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation

class TasksModel {
    
    var tasks: [TaskModel]=[TaskModel]()
    
    var urlAsString: String=ApplicationSettings.taskManagementForProjectAsString
    
    var loaded: Bool=false
    
    init () {
        loaded=false
    }
    
    func load(projectId: String) {
        if self.loaded {
            return
        }
        if let url = URL(string: urlAsString+projectId) {
            URLSession.shared.dataTask(with: url) {data,response,error in
                if let data = data {
                    do {
                        //TODO Handle errors accordingly
                        
                        self.tasks = try JSONDecoder().decode([TaskModel].self, from: data)
                        for task in self.tasks {
                            print(task.name)
                        }
                        self.loaded=true;
                    } catch let error {
                        print(error)
                    }
                }
            } .resume()
        }
    }
}
