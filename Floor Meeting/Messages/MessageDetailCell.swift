//
//  MessageDetailCell.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 5/11/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import SwiftKeychainWrapper

class MessageDetailCell: UITableViewCell {
    
    @IBOutlet weak var recipientImg: UIImageView!
    
    @IBOutlet weak var recipientName: UILabel!
    
    @IBOutlet weak var chatPreview: UILabel!
    
    @IBOutlet weak var userColorView: UIView!
    
    var messageDetail: MessageDetail!
    
    var userPostKey: DatabaseReference!
    
    let currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        recipientImg.layer.cornerRadius = recipientImg.frame.size.height/2
//        userColorView.backgroundColor = .landon()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(messageDetail: MessageDetail) {
        
        self.messageDetail = messageDetail
        
        let recipientData = Database.database().reference().child("users").child(messageDetail.recipient)
        
        recipientData.observeSingleEvent(of: .value, with: { (snapshot) in
            
            let data = snapshot.value as! Dictionary<String, AnyObject>
            
            let username = data["username"]
            
            let userImg = data["userImg"]
            
            self.recipientName.text = username as? String
            
            let ref = Storage.storage().reference(forURL: userImg! as! String)
            
            ref.getData(maxSize: 100000, completion: { (data, error) in
                
                if error != nil {
                    print("could not load image")
                } else {
                    
                    if let imgData = data {
                        
                        if let img = UIImage(data: imgData) {
                            
                            self.recipientImg.image = img
                        }
                    }
                }
            })
        })
    }
}

