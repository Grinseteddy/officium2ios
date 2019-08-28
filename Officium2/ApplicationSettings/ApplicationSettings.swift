//
//  ApplicationSettings.swift
//  Officium2
//
//  Created by Annegret Junker on 22.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation

class ApplicationSettings {
    
    static let projectManagementAsString: String="http://ec2-3-120-34-138.eu-central-1.compute.amazonaws.com:5001/projects"
    
    static let taskManagementForProjectAsString:
        String="http://ec2-3-120-34-138.eu-central-1.compute.amazonaws.com:5000/tasks/project/"
    
    static let taskManagement:
        String="http://ec2-3-120-34-138.eu-central-1.compute.amazonaws.com:5000/tasks/"
    
    
    static let shared: ApplicationSettings=ApplicationSettings()
    
    private init() {
        
    }
    
}
