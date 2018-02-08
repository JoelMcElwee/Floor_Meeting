//
//  AppStoryboard.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 2/6/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//  Taken from tutorial here: https://medium.com/@gurdeep060289/clean-code-for-multiple-storyboards-c64eb679dbf6

import Foundation
import UIKit

enum AppStoryboard : String {
    case Login = "Login"
    case Duty = "Duty"
    case Residents = "Residents"
    case Events = "Events"
    case Training = "Training"
    case Profile = "Profile"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

// Old Way

