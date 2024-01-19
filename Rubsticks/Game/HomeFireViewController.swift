//
//  HomeFireViewController.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/12/23.
//

import Foundation
import UIKit
import FirebaseAuth

class HomeFireViewController: UIViewController {
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    
    var startTime = 180
    var timer = Timer()
    var isTimerRunning = false
    var timeElapsed: Double?
    
    struct GlobalVariable{
        static var baseScore = Int()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In Home Page")
        getSetUpTime()
        getTimeElapsed()
        setUpUI()
        setUpScoreTextLbl()
        runTimer()
    }
    
    @IBAction func resetBtnDidTap(_ sender: Any) {
        timer.invalidate()
        startTime = 60    //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant.
        // timerLabel.text = “\(seconds)”
    }
    
    func setUpUI() {
        setUpBackground()
    }
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(HomeFireViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        startTime -= 1     //This will decrement(count down)the seconds.
        GlobalVariable.baseScore = startTime
        scoreLbl.text = "\(startTime)"
    }
    
    func getSetUpTime() {
        Api.User.getUserInforSingleEvent(uid: Api.User.currentUserId) { (user) in
            print(user.testTime)
            if user.testTime > 0 {
                self.startTime = user.testTime
            } else {
                self.startTime = 180
            }
        }
    }
    
    func getTimeElapsed() {
        Api.User.getUserInforSingleEvent(uid: Api.User.currentUserId) { (user) in
            self.timeElapsed = user.testCloseTime - Date().timeIntervalSince1970
            print("Time elapsed in seconds")
            print(self.timeElapsed as Any)
        }
    }
}
