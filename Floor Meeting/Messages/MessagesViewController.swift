//
//  MessagesViewController.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 5/9/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SwiftKeychainWrapper

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var messageDetail = [MessageDetail]()
    var detail: MessageDetail!
    
    var users = [User]()
    
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    var recipient: String!
    
    var messageId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        fetchUser()
        
//        Database.database().reference().child("users").child(currentUser!).child("messages").observe(.value, with: { (snapshot) in
//            
//            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
//                
//                self.messageDetail.removeAll()
//                
//                for data in snapshot {
//                    
//                    if let messageDict = data.value as? Dictionary<String, AnyObject> {
//                        
//                        let key = data.key
//                        
//                        let info = MessageDetail(messageKey: key, messageData: messageDict)
//                        
//                        self.messageDetail.append(info)
//                    }
//                }
//            }
//            
//            self.tableView.reloadData()
//        })
    }
    
    func fetchUser() {
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: Any] {
                let user = User()
                user.name = dictionary["name"] as? String
                user.email = dictionary["email"] as? String
                user.profileImageUrl = dictionary["profileImageUrl"] as? String
                
                self.users.append(user)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
//            print("User Found")
//            print(snapshot)
        }, withCancel: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = users[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as? MessageDetailCell {
            cell.recipientName.text = user.name
            //cell.configureCell(messageDetail: detail)
            //cell.recipientImg.image
            cell.recipientImg.image = #imageLiteral(resourceName: "chin guy")
            cell.recipientImg.clipsToBounds = true
            
            if let profileImageUrl = user.profileImageUrl {
                
                cell.recipientImg.loadImageUsingCacheWithUrlString(urlString: profileImageUrl)
//                let url = URL(string: profileImageUrl)
//                URLSession.shared.dataTask(with: url!) { (data, response, error) in
//
//                    // Download hit an error so lets return out
//                    if error != nil {
//                        print(error)
//                        return
//                    }
//                    DispatchQueue.main.async {
//                        cell.recipientImg.image = UIImage(data: data!)
//                    }
//
//                }.resume()
            }
            
            return cell
        } else {
            return MessageDetailCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        recipient = messageDetail[indexPath.row].recipient
//
//        messageId = messageDetail[indexPath.row].messageRef.key
        
        performSegue(withIdentifier: "toMessages", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? MessageVC {
            
            destinationViewController.recipient = recipient
            
            destinationViewController.messageId = messageId
        }
    }
}
