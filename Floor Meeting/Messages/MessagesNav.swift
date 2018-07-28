//
//  MessagesNav.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 5/9/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit

class MessagesNav: UINavigationController {

    static func storyboardInstance() -> MessagesNav? {
        let storyboard = UIStoryboard(name: "Messages", bundle: nil)
        
        return storyboard.instantiateInitialViewController() as? MessagesNav
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
