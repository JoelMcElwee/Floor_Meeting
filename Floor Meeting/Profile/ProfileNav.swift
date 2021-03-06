//
//  ProfileNav.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 2/7/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit

class ProfileNav: UINavigationController {
    
    static func storyboardInstance() -> ProfileNav? {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        
        return storyboard.instantiateInitialViewController() as? ProfileNav
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
