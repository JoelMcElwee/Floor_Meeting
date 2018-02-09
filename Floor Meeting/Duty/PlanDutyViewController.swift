//
//  PlanDutyViewController.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 2/8/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit

class PlanDutyViewController: UIViewController {

   
    @IBAction func exitAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var dutyPlanLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        exitButton.layer.cornerRadius = 12
        dutyPlanLabel.layer.masksToBounds = true
        dutyPlanLabel.layer.cornerRadius = 24
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
