//
//  LoginViewController.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 2/3/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var login_Button_Outlet: UIButton!
    
    @IBOutlet weak var signup_Button_Outlet: UIButton!
    
    @IBAction func login_Button_Action(_ sender: Any) {
        if userTextField.text == "" && passwordTextField.text == ""{
            print("logged in")
            let controller = storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
            self.present(controller!, animated: true, completion: nil)
            
        }
        
        
    }
    @IBAction func signup_Button_Action(_ sender: Any) {
        print("sign-up")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        login_Button_Outlet.layer.cornerRadius = 10
        signup_Button_Outlet.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
