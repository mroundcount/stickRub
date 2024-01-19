//
//  gatherViewController.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/11/23.
//

import Foundation
import UIKit
import CoreMotion


class GatherViewController: UIViewController {
    
    let activityManager = CMMotionActivityManager()
    let pedoMeter = CMPedometer()
    
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        if CMMotionActivityManager.isActivityAvailable() {
            self.activityManager.startActivityUpdates(to: OperationQueue.main) { (data) in
                DispatchQueue.main.async {
                    if let activity = data {
                        if activity.running == true {
                            print("Running")
                        }
                        if activity.walking == true {
                            print("Walking")
                        }
                        if activity.automotive == true {
                            print("Automotive")
                        }
                    }
                }
            }
        }
        
        if CMPedometer.isStepCountingAvailable() {
            self.pedoMeter.startUpdates(from: Date()) { (data, error) in
                if error == nil {
                    if let response = data {
                        DispatchQueue.main.async {
                            self.counterLbl.text = "Step Counter: \(response.numberOfSteps)"
                            self.distanceLbl.text = "Distance: \(response.distance ?? 0) "
                        }
                    }
                }
            }
        }

    }
    
    func setUpUI() {
        setUpBackground()
        setUpCounterTextTextLbl()
        setUpDistanceTextLbl()
        setUpStartBtn()
        setUpStopBtn()
    }
    
    @IBAction func startBtnDidTap(_ sender: Any) {
        print("Start Button Did Tap")
    }
    
    @IBAction func stopBtnDidTap(_ sender: Any) {
        print("Stop Button Did Tap")
        
    }
    
}
