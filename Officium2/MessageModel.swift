//
//  MessageModel.swift
//  Officium2
//
//  Created by Annegret Junker on 02.09.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation

class MessageModel : Codable {
    
    var code: String = "SUCCESS"
    var severity: String = "SUCCESS"
    var message: String = ""
    var trackingId : String = ""
    
}
