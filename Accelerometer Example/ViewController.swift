//
//  ViewController.swift
//  Accelerometer Example
//
//  Created by Jeff Kempista on 11/17/14.
//  Copyright (c) 2014 Jeff Kempista. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let dateFormatter = NSDateFormatter()
    let motionManager = CMMotionManager()
    
    @IBOutlet weak var accelerationXLabel: UILabel!
    @IBOutlet weak var accelerationYLabel: UILabel!
    @IBOutlet weak var accelerationZLabel: UILabel!
    
    @IBOutlet weak var gyroXLabel: UILabel!
    @IBOutlet weak var gyroYLabel: UILabel!
    @IBOutlet weak var gyroZLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        self.dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startStopTapped(sender: UISegmentedControl) {
        
        if (sender.selectedSegmentIndex == 1) {
            println("Start Accelerometer Monitoring")
            self.startMonitoringForAccelerometerUpdates()
        } else {
            println("Stop Acceleromter Monitoring")
            self.motionManager.stopAccelerometerUpdates()
            self.accelerationXLabel.text = "x: "
            self.accelerationYLabel.text = "y: "
            self.accelerationZLabel.text = "z: "
        }
    }
    
    func startMonitoringForAccelerometerUpdates() {
        self.motionManager.accelerometerUpdateInterval = 0.01
        self.motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, _) -> Void in
            self.accelerationXLabel.text = "x: \(data.acceleration.x)"
            self.accelerationYLabel.text = "y: \(data.acceleration.y)"
            self.accelerationZLabel.text = "z: \(data.acceleration.z)"
        }
    }

    @IBAction func startStopGyroscope(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 1) {
            self.startMonitoringForGyroscopeUpdates()
        } else {
            println("Stop Gyroscope Monitoring")
            self.motionManager.stopGyroUpdates()
            self.gyroXLabel.text = "x: "
            self.gyroYLabel.text = "y: "
            self.gyroZLabel.text = "z: "
        }
    }
    
    func startMonitoringForGyroscopeUpdates() {
        self.motionManager.gyroUpdateInterval = 0.01
        self.motionManager.startGyroUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, error) -> Void in
            self.gyroXLabel.text = "x: \(data.rotationRate.x)"
            self.gyroYLabel.text = "y: \(data.rotationRate.y)"
            self.gyroZLabel.text = "z: \(data.rotationRate.z)"
        }
    }
    
    @IBAction func startStopDeviceMotion(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 1) {
            self.startMonitoringForDeviceMotionUpdates()
        }
    }
    
    func startMonitoringForDeviceMotionUpdates() {
        self.motionManager.deviceMotionUpdateInterval = 0.01
        self.motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, error) -> Void in

        }
    }
    
}

