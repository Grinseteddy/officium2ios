//
//  LoginController.swift
//  Officium2
//
//  Created by Annegret Junker on 21.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    var currentUser : UserManagement = UserManagement()
    
    @IBOutlet weak var UserNameInput: UITextField!
    
    @IBOutlet weak var PasswordInput: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func userNameDidEditBegin(_ sender: Any) {
        if UserNameInput.text=="User Name" {
            UserNameInput.text=""
        }
    }
    

    @IBAction func userNameDidEditEnd(_ sender: Any) {
    }
    
    @IBAction func passwordDidEditBegin(_ sender: Any) {
        if PasswordInput.text=="Password" {
            PasswordInput.text=""
        }
    }
    
    @IBAction func passwordDidEditEnd(_ sender: Any) {
    }
    
    
    @IBAction func loginClick(_ sender: Any) {
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
