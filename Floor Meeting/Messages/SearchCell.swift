//
//  SearchCell.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 5/11/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import SwiftKeychainWrapper

class searchCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    var searchDetail: Search!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCell(searchDetail: Search) {
        
        self.searchDetail = searchDetail
        
        nameLbl.text = searchDetail.username
        
        let ref = Storage.storage().reference(forURL: searchDetail.userImg)
        
        ref.getData(maxSize: 1000000, completion: { (data, error) in
            
            if error != nil {
                
                print(" we couldnt upload the img")
                
            } else {
                
                if let imgData = data {
                    
                    if let img = UIImage(data: imgData) {
                        
                        self.userImage.image = img
                    }
                }
            }
            
        })
    }
    
}

