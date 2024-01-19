//
//  AccountViewController+UI.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/12/23.
//

import Foundation
import UIKit

extension AccountViewController {
    
    func setUpBackground() {
        self.view.backgroundColor = UIColor.black
    }
    
    func setUpWelcomeLabel() {
        welcomeLbl.textColor = UIColor.green
        welcomeLbl.font = UIFont.boldSystemFont(ofSize: 22)
        // welcomeLbl.text = " \(user!.email)"
    }
    
    func setUpLogoutBtn() {
        logoutBtn.setTitle("Log Out", for: UIControl.State.normal)
        logoutBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        logoutBtn.backgroundColor = UIColor.white
        logoutBtn.layer.cornerRadius = 27.5
        logoutBtn.clipsToBounds = true
        logoutBtn.setTitleColor(.white, for: UIControl.State.normal)
        logoutBtn.backgroundColor = UIColor.green
    }
}
