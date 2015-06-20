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

    
    
    @IBAction func button(sender: AnyObject) {
        
        
        
    }
      var timer = NSTimer()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        loop()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

func loop() {
    var systemTime:NSTimeInterval
    var milliseconds:Int
    var remainder: Int
    
    var isOn:Bool
    
    let interval = 150
    
    isOn = false
    while  true {
        systemTime = NSDate().timeIntervalSince1970
        milliseconds = Int(systemTime*1000)
        remainder = milliseconds % interval
        
        if remainder >= 0 && remainder <= interval/4 {
       
            if !isOn {
                print(" On")
                println(milliseconds)
               strobeOn()
                isOn = true
            }
        }
        else
        {
            if isOn {
                print(" Off")
                println(milliseconds)
                strobeOff()
                isOn = false
            }
        }
    }
}

func strobeOn() {
    
    
    let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    if (device.hasTorch) {
        
        println("device has touch")
        
        device.lockForConfiguration(nil)
        device.setTorchModeOnWithLevel(1.0, error: nil)
        device.unlockForConfiguration()
    }
}

func strobeOff() {

    
let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
if (device.hasTorch) {
    
    println("device has touch")
    
    device.lockForConfiguration(nil)
    device.torchMode = AVCaptureTorchMode.Off
    device.unlockForConfiguration()
}
}

func strobeToggle() {
    
    
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

