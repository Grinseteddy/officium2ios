//
//  ApplicationSettings.swift
//  Officium2
//
//  Created by Annegret Junker on 22.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation

class ApplicationSettings {
    
    static let projectManagementAsString: String="http://officium.annegret.info:5001/projects"
    
    static let taskManagementForProjectAsString:
        String="http://officium.annegret.info:5000/tasks/project/"
    
    static let taskManagement:
        String="http://officium.annegret.info:5000/tasks/"
    
    static let login:
        String="http://officium.annegret.info:5051/login/"
    
    static let userManagement:
        String="http://officium.annegret.info:5050/user/"
    
    
    static let shared: ApplicationSettings=ApplicationSettings()
    
    private init() {
        
    }
    
}
