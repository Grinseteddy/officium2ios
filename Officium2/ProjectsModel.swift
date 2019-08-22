//
//  ProjectsModel.swift
//  Officium2
//
//  Created by Annegret Junker on 22.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation
import UIKit

class ProjectsModel {
    
    var projects: [ProjectModel]=[]
    var loaded: Bool=false;
    
    let urlAsString : String=ApplicationSettings.projectManagementAsString
    
    init() {
        self.loaded=false
        load()
    }
    
    func load() {
        if self.loaded {
            return
        }
        if let url = URL(string: urlAsString) {
            URLSession.shared.dataTask(with: url) {data,response,error in
                if let data = data {
                    do {
                        //TODO Handle errors accordingly
                        
                        self.projects = try JSONDecoder().decode([ProjectModel].self, from: data)
                        for project in self.projects {
                            print(project.name)
                        }
                        self.loaded=true;
                    } catch let error {
                        print(error)
                    }
                }
                } .resume()
        }
    }
    
    func fillWithMockup(){
        let project: ProjectModel=ProjectModel()
        project.name="First Project"
        projects.append(project)
        let project2: ProjectModel=ProjectModel()
        project2.name="Second Project"
        projects.append(project2)
        let project3: ProjectModel=ProjectModel()
        project3.name="Third Project"
        projects.append(project3)
    }
}
