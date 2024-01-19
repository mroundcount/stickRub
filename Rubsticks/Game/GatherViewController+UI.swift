//
//  GatherViewController+UI.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/11/23.
//

import Foundation
import UIKit

extension GatherViewController {
        
    func setUpBackground() {
        self.view.backgroundColor = UIColor.black
    }
    
    func setUpCounterTextTextLbl() {
        counterLbl.textColor = UIColor.white
        counterLbl.font = UIFont.boldSystemFont(ofSize: 22)
        counterLbl.text = "Step Counter: 0"
    }
    
    func setUpDistanceTextLbl() {
        distanceLbl.textColor = UIColor.white
        distanceLbl.font = UIFont.boldSystemFont(ofSize: 22)
        distanceLbl.text = "Distance: 0"
    }
    
    func setUpStartBtn() {
        startBtn.setTitle("Start Tracking", for: UIControl.State.normal)
        startBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        startBtn.setTitleColor(.green, for: .normal)
        startBtn.backgroundColor = UIColor.black
        startBtn.layer.borderWidth = 2
        startBtn.layer.borderColor = UIColor.green.cgColor
        startBtn.layer.cornerRadius = 27.5
        startBtn.clipsToBounds = true
    }
    
    
    func setUpStopBtn() {
        stopBtn.setTitle("Stop Tracking", for: UIControl.State.normal)
        stopBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        stopBtn.setTitleColor(.white, for: .normal)
        stopBtn.backgroundColor = UIColor.green
        stopBtn.layer.cornerRadius = 27.5
        stopBtn.clipsToBounds = true
    }
 
}
