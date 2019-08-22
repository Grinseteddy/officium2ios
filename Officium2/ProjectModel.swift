//
//  ProjectModel.swift
//  Officium2
//
//  Created by Annegret Junker on 22.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation

class ProjectModel : Codable {
    
    
    var id: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa"
    var name: String="Just a default name"
    var team: String?=nil
    var createdAt: String?="2019-08-19T15:06"
    var createdBy: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa"
    var updatedAt: String?="2019-08-19T15:06"
    var updatedBy: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa"
    var thread: String?=nil
    
    init(id: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa", name: String="Just a default name", team: String?="team", createdAt: String?="2019-08-19T15:06", createdBy: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa", updatedAt: String?="2019-08-19T15:06", updatedBy: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa", thread: String? = nil) {
        self.id=id
        self.name=name
        self.team=team
        self.createdAt=createdAt
        self.createdBy=createdBy
        self.updatedAt=updatedAt
        self.updatedBy=updatedBy
        self.thread=thread
    }
}
