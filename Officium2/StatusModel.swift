//
//  StatusModel.swift
//  Officium2
//
//  Created by Annegret Junker on 27.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation

class StatusModel: Comparable {
    
    let model = ["NEW", "OPEN", "IN PROGRESS", "IN REVIEW", "DONE", "RELEASED"]
    var key: String
    var tasks: [TaskModel]
    
    init() {
        key="NEW"
        tasks=[TaskModel]()
    }
    
    static func < (lhs: StatusModel, rhs: StatusModel) -> Bool {
        let leftPlace: Int = lhs.model.firstIndex(of: lhs.key) ?? 0
        let rightPlace: Int = rhs.model.firstIndex(of: rhs.key) ?? 0
        return leftPlace<rightPlace
        
    }
    
    static func == (lhs: StatusModel, rhs: StatusModel) -> Bool {
        return lhs.key == rhs.key
    }
    
}
