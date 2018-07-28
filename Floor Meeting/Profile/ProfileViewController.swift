//
//  ProfileViewController.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 2/5/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    let rootRef = Database.database().reference()

    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func logoutAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Are you sure you would like to logout?", message: "You'll lose you're place!!!!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.logout()
            
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        
        
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            logout()
        }
        else {
            let uid = Auth.auth().currentUser?.uid
            let nameRef = rootRef.child("users").child(uid!)
            nameRef.observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    self.navigationItem.title = dictionary["name"] as? String
                }
                else {
                    print("error")
                }
            }, withCancel: nil)
        }
        
        
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        }
        catch let logoutError {
            print(logoutError)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
