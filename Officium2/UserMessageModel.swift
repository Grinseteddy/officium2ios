//
//  UserMessageModel.swift
//  Officium2
//
//  Created by Annegret Junker on 02.09.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation

struct UserMessageModel : Codable {
    
    var user : UserModel?
    var usefulLinks : [LinkModel]?
    var message : MessageModel?
    
    init() {
        user = UserModel()
        usefulLinks = nil
        message = MessageModel()
    }

}
