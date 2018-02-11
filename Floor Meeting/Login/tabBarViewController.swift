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
        dutyVC?.title = "Duty"
        let resVC = ResidentsNav.storyboardInstance()
        let eventsVC = EventsNav.storyboardInstance()
        let trainVC = TrainingNav.storyboardInstance()
        let profVC = ProfileNav.storyboardInstance()

        let controllers = [dutyVC,resVC,profVC,eventsVC,trainVC]
        dutyVC?.tabBarItem.image = #imageLiteral(resourceName: "Duty Icon")
        dutyVC?.tabBarItem.selectedImage = #imageLiteral(resourceName: "Duty Icon").withRenderingMode(.alwaysOriginal)
        dutyVC?.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.campbell()], for: .selected)
        
        trainVC?.tabBarItem.selectedImage = #imageLiteral(resourceName: "Training Icon").withRenderingMode(.alwaysOriginal)
        trainVC?.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.mayo()], for: .selected)
        
        profVC?.tabBarItem.selectedImage = #imageLiteral(resourceName: "green Profile Icon").withRenderingMode(.alwaysOriginal)
        profVC?.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.gilchrist()], for: .selected)
        
        eventsVC?.tabBarItem.selectedImage = #imageLiteral(resourceName: "Events Icon").withRenderingMode(.alwaysOriginal)
        eventsVC?.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.yakeley()], for: .selected)
        
        resVC?.tabBarItem.selectedImage = #imageLiteral(resourceName: "Residents Icon").withRenderingMode(.alwaysOriginal)
        resVC?.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.williams()], for: .selected)
        
        self.viewControllers = controllers as? [UIViewController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
