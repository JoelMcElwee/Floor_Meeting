//
//  TrainingNav.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 2/7/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit

class TrainingNav: UINavigationController {

    static func storyboardInstance() -> TrainingNav? {
        let storyboard = UIStoryboard(name: "Training", bundle: nil)
        
        return storyboard.instantiateInitialViewController() as? TrainingNav
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
