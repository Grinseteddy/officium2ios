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
    
    var sortedByStatus: [StatusModel] = [StatusModel]()
    
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
    
    func updateTask(task: TaskModel) {
        
        guard let uploadData = try? JSONEncoder().encode(task) else {
            return
        }
        
        let url = URL(string: ApplicationSettings.taskManagement+task.id)!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            if let error = error {
                print ("error: \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print ("server error")
                    return
            }
            if let mimeType = response.mimeType,
                mimeType == "application/json",
                let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print ("got data: \(dataString)")
            }
        }
        task.resume()
    }
    
    func sortTasksByStatus() {
        if (!loaded) {
            return
        }
        let staticModel: StatusModel = StatusModel()
        
        if sortedByStatus.count > 0 {
            sortedByStatus.removeAll()
        }
        
        for status in staticModel.model {
            let model: StatusModel = StatusModel()
            for task in tasks {
                if task.status == status {
                    model.key=status
                    model.tasks.append(task)
                }
            }
            if model.tasks.count != 0 {
                sortedByStatus.append(model)
            }
        }

    }
}
