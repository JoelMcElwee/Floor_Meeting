//
//  LoginViewController.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 2/3/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import LocalAuthentication

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var rememberToggle: UISwitch!
    
    @IBAction func login(_ sender: Any) {
        guard let email = userTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil && user == nil {
                print(error?.localizedDescription)
                return
            }
            else {
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
                self.present(controller!, animated: true, completion: nil)
            }
        }
//        if userTextField.text == "" && passwordTextField.text == ""{
//            print("logged in")
//            let controller = storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
//            self.present(controller!, animated: true, completion: nil)
//        }
    }
    @IBAction func switchSwitched(_ sender: Any) {
        if rememberToggle.isOn {
            let context : LAContext = LAContext()
            if !context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
                let alert = UIAlertController(title: "Would you like to use FaceID to login in the future?", message: "You will have to enter your email and password first before this is saved", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please Verify", reply: { (correct, error) in
                        
                        if correct {
                            // I believe this needs to be done because it creates its
                            // own thread otherwise? Need to research this more.
                            DispatchQueue.main.async {
                                let controller = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
                                self.navigationController?.pushViewController(controller!, animated: true)
                            }
                        }
                        else {
                            print("Failure")
                            print("\(error.debugDescription)")
                        }
                    })
                    
                }))
                
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
            }
            
            
        }
    }
    
    @IBAction func signup(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "signUp")
        self.present(controller!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        
//        let context: LAContext = LAContext()
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please Verify", reply: { (correct, error) in
//                if correct {
//                    // I believe this needs to be done because it creates its
//                    // own thread otherwise? Need to research this more.
//                    DispatchQueue.main.async {
//                        let controller = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
//                        self.navigationController?.pushViewController(controller!, animated: true)
//                    }
//                }
//                else {
//                    print("Failure")
//                    print("\(error.debugDescription)")
//                }
//            })
//        }
//        else {
//            print("No Bio")
//        }
        
    }
    

}

extension UIViewController {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
