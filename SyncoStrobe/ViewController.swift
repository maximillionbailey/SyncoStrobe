//
//  ViewController.swift
//  SyncoStrobe
//
//  Created by Michael Bailey on 20/06/2015.
//  Copyright (c) 2015 Bailey's Empire. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(strobe())
        // prints "hello, world"

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


func strobe() -> String {
  
    
    let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    if device.hasTorch {
        device.lockForConfiguration(nil)
        device.setTorchModeOnWithLevel(1.0, error: nil)
        device.unlockForConfiguration()
    }
    
    println("Hi!")
    
    return "Strobe"
}


