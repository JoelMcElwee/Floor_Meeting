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
    
    let rootRef = Database.database().reference()

    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var wygLabel: UILabel!
    @IBOutlet weak var clmLabel: UILabel!
    @IBOutlet weak var acdLabel: UILabel!
    @IBOutlet weak var onDutyView: UIView!
    @IBOutlet weak var navBarTitle: UINavigationItem!
    @IBOutlet weak var onDutyLabel: UILabel!
    @IBOutlet weak var logButton: UIButton!
    @IBOutlet weak var swapButton: UIButton!
    @IBOutlet weak var planButton: UIButton!
    @IBOutlet weak var emergencyButton: UIButton!
    @IBOutlet weak var dropDownIcon: UIButton!
    @IBOutlet weak var onDutyTodayView: UIView!
    
    
    
    
    var dropState = 0
    
    @IBAction func dropDown(_ sender: Any) {
        let labelArr = [acdLabel, clmLabel, wygLabel]
        
        if dropState == 0{
            UIView.animate(withDuration: 0.5) { () -> Void in
                self.dropDownIcon.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                
                self.onDutyView.isHidden = false
                self.onDutyView.frame.size.height = 600
                for l in labelArr {
                    l?.isHidden = false
                }

                
                
            }
            dropState = 1
        }
        else {
            UIView.animate(withDuration: 0.5) { () -> Void in
                self.dropDownIcon.transform = CGAffineTransform(rotationAngle: (CGFloat.pi * 2.0))
                self.onDutyView.frame.size.height = 0
                for l in labelArr {
                    l?.isHidden = true
                }
            }
            dropState = 0
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let onDutyRef = rootRef.child("onDuty")
        onDutyRef.observe(.value) { (snap: DataSnapshot) in
            self.onDutyLabel?.text = snap.value as? String
        }
        
        let buttons = [logButton,swapButton,planButton,emergencyButton]
        let labelArr = [acdLabel, clmLabel, wygLabel]
        
        
        
        for l in labelArr {
            l?.isHidden = true
        }
        
        for b in buttons {
            b?.layer.cornerRadius = 12
            b?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            b?.titleLabel?.textAlignment = NSTextAlignment.center
        }
        
        logButton?.setTitle("LOG", for: .normal)
        swapButton?.setTitle("SWAP", for: .normal)
        planButton?.setTitle("PLAN", for: .normal)
        emergencyButton?.setTitle("EMERGENCY\nCONTACT", for: .normal)
        
        //Dropview initialization
//        self.view.addSubview(self.dropView)
//        self.dropView.backgroundColor = UIColor.landon()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


