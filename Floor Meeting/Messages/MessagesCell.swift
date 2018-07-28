//
//  MessagesCell.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 5/11/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class MessagesCell: UITableViewCell {
    
    @IBOutlet weak var recievedMessageLbl: UILabel!
    
    @IBOutlet weak var recievedMessageView: UIView!
    
    @IBOutlet weak var sentMessageLbl: UILabel!
    
    @IBOutlet weak var sentMessageView: UIView!
    
    var message: Message!
    
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCell(message: Message) {
        
        self.message = message
        
        if message.sender == currentUser {
            
            sentMessageView.isHidden = false
            
            sentMessageLbl.text = message.message
            
            recievedMessageLbl.text = ""
            
            recievedMessageLbl.isHidden = true
            
        } else {
            
            sentMessageView.isHidden = true
            
            sentMessageLbl.text = ""
            
            recievedMessageLbl.text = message.message
            
            recievedMessageLbl.isHidden = false
        }
    }
    
}

