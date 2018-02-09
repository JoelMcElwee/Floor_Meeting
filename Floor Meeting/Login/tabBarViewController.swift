//
//  tabBarViewController.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 2/5/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit

class tabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dutyVC = DutyNav.storyboardInstance()
        dutyVC?.title = "DUTY"
        dutyVC?.view.backgroundColor = UIColor.red

        let resVC = ResidentsNav.storyboardInstance()
        resVC?.title = "RESIDENTS"
        resVC?.view.backgroundColor = UIColor.blue

        let eventsVC = EventsNav.storyboardInstance()
        eventsVC?.title = "EVENTS"
        eventsVC?.view.backgroundColor = UIColor.cyan

        let trainVC = TrainingNav.storyboardInstance()
        trainVC?.title = "TRAINING"
        trainVC?.view.backgroundColor = UIColor.green

        let profVC = ProfileNav.storyboardInstance()
        profVC?.title = "Test"
        profVC?.view.backgroundColor = UIColor.yellow

        let controllers = [dutyVC,resVC,profVC,eventsVC,trainVC]
        
        dutyVC?.tabBarItem.image = #imageLiteral(resourceName: "Duty Icon")
        trainVC?.tabBarItem.image = #imageLiteral(resourceName: "Training Icon")
        profVC?.tabBarItem.image = #imageLiteral(resourceName: "Profile Icon")
        eventsVC?.tabBarItem.image = #imageLiteral(resourceName: "Events Icon")
        resVC?.tabBarItem.image = #imageLiteral(resourceName: "Residents Icon")
        
        
        self.viewControllers = controllers as? [UIViewController]
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
