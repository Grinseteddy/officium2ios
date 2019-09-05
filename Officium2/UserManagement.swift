//
//  UserManagement.swift
//  Officium2
//
//  Created by Annegret Junker on 02.09.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation



class UserManagement {
    
    var currentUser = UserMessageModel()
    var loaded = false
    var error = false
    var assigneeloaded=false
    var assignee: UserMessageModel = UserMessageModel()
    var updatedByLoaded = false
    var updatedBy: UserMessageModel = UserMessageModel()
    
    init() {
        
    }
    
    func getUserById(assigneeId: String) {
        
        if self.assigneeloaded {
            return
        }
        if let url = URL(string: ApplicationSettings.userManagement+assigneeId) {
            URLSession.shared.dataTask(with: url) {data,response,error in
                if let data = data {
                    do {
                        //TODO Handle errors accordingly
                        
                        self.assignee = try JSONDecoder().decode(UserMessageModel.self, from: data)
                        print(self.assignee.user?.name as Any)
                        self.assigneeloaded=true;
                    } catch let error {
                        print(error)
                    }
                }
            } .resume()
        }
    }
    
    func getUpdatedById(updatedById: String) {
        
        if self.updatedByLoaded {
            return
        }
        if let url = URL(string: ApplicationSettings.userManagement+updatedById) {
            URLSession.shared.dataTask(with: url) {data,response,error in
                if let data = data {
                    do {
                        //TODO Handle errors accordingly
                        
                        self.updatedBy = try JSONDecoder().decode(UserMessageModel.self, from: data)
                        print(self.updatedBy.user?.name as Any)
                        self.updatedByLoaded=true;
                    } catch let error {
                        print(error)
                    }
                }
                } .resume()
        }
    }
    
    func getUserByName(name: String) {
        
        //add get name with user session
        //look how to setup request
        
        let urlAsSring: String? = "http://ec2-3-120-34-138.eu-central-1.compute.amazonaws.com:5051/login/name/"+name
        
        
        if urlAsSring == nil {
            print("Irregular user name")
            self.error = true
            return
        }
        
        
        
        let url: URL? = URL(string: urlAsSring!)
        
        if url == nil {
            print("Irregular user name")
            self.error = true
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, error, response in
            
            if (data == nil || error != nil) {
                print(error.debugDescription)
                self.error = true
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if (httpResponse.statusCode == 200) {
                    print(httpResponse.statusCode)
                    print(self.currentUser.message?.message ?? "Error")
                    self.error = true
                    return
                }
            }
            
            do {
                self.currentUser = try JSONDecoder().decode(UserMessageModel.self, from: data!)
                print(self.currentUser.user!.username)
                self.loaded=true;
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}
