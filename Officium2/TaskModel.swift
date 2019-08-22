//
//  TaskModel.swift
//  Officium2
//
//  Created by Annegret Junker on 22.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation

class TaskModel : Decodable {
    
    var id: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa"
    var name: String="Task Name"
    var assignee: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa"
    var status: String="ToDo"
    var updatedBy: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa"
    var updatedAt: String="2019-08-20T13:21"
    var createdBy: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa"
    var createdAt: String?="2019-08-20T13:21"
    var duedate: String?="2019-10-30"
    var project: String?="sampleGU-IDsa-mple-GUID-sampleGUIDsa"
    
    init(id: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa", name: String="Task Name", assignee: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa", status: String="ToDo", updatedBy: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa", updatedAt: String="2019-08-20T13:21", createdBy: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa", createdAt: String="2019-08-20T13:21", duedate: String="2019-10-30", project: String="sampleGU-IDsa-mple-GUID-sampleGUIDsa") {
        self.id=id
        self.name=name
        self.assignee=assignee
        self.status=status
        self.updatedBy=updatedBy
        self.updatedAt=updatedAt
        self.createdBy=createdBy
        self.createdAt=createdAt
        self.duedate=duedate
        self.project=project
    }
}
