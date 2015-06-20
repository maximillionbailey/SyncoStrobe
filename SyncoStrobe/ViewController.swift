//
//  ViewController.swift
//  SyncoStrobe
//
//  Created by Michael Bailey on 20/06/2015.
//  Copyright (c) 2015 Bailey's Empire. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var timer = NSTimer()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        
        strobeOn()
        // prints "hello, world"

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




func strobeOn() {

    
let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
if (device.hasTorch) {
    
    println("device has touch")
    
    device.lockForConfiguration(nil)
    if (device.torchMode == AVCaptureTorchMode.On) {
        device.torchMode = AVCaptureTorchMode.Off
    } else {
        device.setTorchModeOnWithLevel(1.0, error: nil)
    }
    device.unlockForConfiguration()
}
}
