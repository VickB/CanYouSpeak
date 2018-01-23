//
//  AuthentificationViewController.swift
//  canyouspeak
//
//  Created by gaby on 22/01/2018.
//  Copyright © 2018 gaby. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit

class AuthentificationViewController: UIViewController {
    
    var dict : [String : AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create button
        let loginButton = LoginButton(readPermissions: [.publicProfile ])
        loginButton.frame =  CGRect(origin: CGPoint(x: 36,y :462), size: CGSize(width: 303, height: 48))
        view.addSubview(loginButton)
        
        //when login button clicked
        func loginButtonClicked(_ loginButton: LoginButton, result: LoginResult) {
            let loginManager = LoginManager()
            loginManager.logIn(readPermissions: [ .publicProfile], viewController: self) { loginResult in
                switch loginResult {
                case .failed(let error):
                    print(error)
                    break
                case .cancelled:
                    print("User cancelled login.")
                    break
                case .success( _, _, _):
                    self.performSegue(withIdentifier: "showListLanguage", sender: nil)
                    print("success")
                    break
                }
            }
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
