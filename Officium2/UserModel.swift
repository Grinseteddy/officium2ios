//
//  UserModel.swift
//  Officium2
//
//  Created by Annegret Junker on 29.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation

class UserName: Decodable, Encodable {
    
    var userName: String = "johnfoo"
    
    let nameUrl: String=ApplicationSettings.login+"name"
    let emailUrl: String=ApplicationSettings.login+"emailaddress"
    
    init() {
        
    }
    
    init(userName: String) {
        self.userName = userName
    }
}

class UserModel : Decodable, Encodable {
    
    var id: String = ""
    var name: String = "Foo"
    var surname: String = "John"
    var username: String = "johnfoo"
    var emailAddress: String = "john.foo@organization.com"
    var password: String = "password"
    var defaultPicture: String = "Teddy"
    
    init() {
        
    }
    
    init(id: String, name: String, surname: String, username: String, emailAddress: String, password: String, defaultPicture: String) {
        self.id = id
        self.name = name
        self.surname = surname
        self.username = username
        self.emailAddress = emailAddress
        self.password = password
        self.defaultPicture = defaultPicture
    }
    
    
 
}
