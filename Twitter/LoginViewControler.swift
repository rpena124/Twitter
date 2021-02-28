//
//  LoginViewControler.swift
//  Twitter
//
//  Created by Rosa Peña on 2/27/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewControler: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
           //to stay logged in
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            //when login succeeds
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
            //when login fails
        }, failure: { (Error) in
            print("Could not log in!")
        })
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
