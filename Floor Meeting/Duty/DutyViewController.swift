//
//  DutyViewController.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 2/5/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit
import Firebase



class DutyViewController: UIViewController {

    @IBOutlet weak var startRoundButton: UIButton!
    @IBOutlet weak var logButton: UIButton!
    @IBOutlet weak var swapButton: UIButton!
    @IBOutlet weak var planButton: UIButton!
    @IBOutlet weak var handbookButton: UIButton!
    @IBOutlet weak var emergencyButton: UIButton!
    @IBOutlet weak var dropDownIcon: UIButton!
    @IBOutlet weak var onDutyTodayView: UIView!
    
    let dropView = UIView()
    
    var dropState = 0
    
    @IBAction func dropDown(_ sender: Any) {
        if dropState == 0{
            UIView.animate(withDuration: 0.5) { () -> Void in
                self.dropDownIcon.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.dropView.frame.size.height = 600
            }
            dropState = 1
        }
        else {
            UIView.animate(withDuration: 0.5) { () -> Void in
                self.dropDownIcon.transform = CGAffineTransform(rotationAngle: (CGFloat.pi * 2.0))
                self.dropView.frame.size.height = 0
            }
            dropState = 0
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttons = [startRoundButton,logButton,swapButton,planButton,handbookButton,emergencyButton]
        
        for b in buttons {
            b?.layer.cornerRadius = 12
            b?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            b?.titleLabel?.textAlignment = NSTextAlignment.center
        }
        
        startRoundButton?.setTitle("START\nROUND", for: .normal)
        logButton?.setTitle("LOG", for: .normal)
        swapButton?.setTitle("SWAP", for: .normal)
        planButton?.setTitle("PLAN", for: .normal)
        handbookButton?.setTitle("HANDBOOK", for: .normal)
        emergencyButton?.setTitle("EMERGENCY\nCONTACT", for: .normal)
        
        //Dropview initialization
        
        dropView.frame = CGRect(x: 0, y: onDutyTodayView.frame.origin.y + onDutyTodayView.frame.size.height, width: 375, height: 20)
        self.view.addSubview(dropView)
        dropView.backgroundColor = UIColor.landon()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


