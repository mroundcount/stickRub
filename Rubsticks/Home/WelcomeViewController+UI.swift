//
//  WelcomeViewController+UI.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/6/23.
//

import Foundation
import UIKit

extension WelcomeViewController {
    
    func setUpBackground() {
        self.view.backgroundColor = UIColor.black
    }
    
    func setUpHeaderTitle() {
        titleLbl.textColor = UIColor.white
        termsOfServiceLbl.font = UIFont.boldSystemFont(ofSize: 22)
        titleLbl.text = "Welcome to Stick Rubbin"
    }
    
    func setUpSignInBtn() {
        signInBtn.setTitle("Sign in with email", for: UIControl.State.normal)
        signInBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        signInBtn.setTitleColor(.green, for: .normal)
        signInBtn.backgroundColor = UIColor.black
        signInBtn.layer.borderWidth = 2
        signInBtn.layer.borderColor = UIColor.green.cgColor
        signInBtn.layer.cornerRadius = 27.5
        signInBtn.clipsToBounds = true
    }
    
    
    func setUpCreateAccountBtn() {
        createAccountBtn.setTitle("Create a new account", for: UIControl.State.normal)
        createAccountBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        createAccountBtn.setTitleColor(.white, for: .normal)
        createAccountBtn.backgroundColor = UIColor.green
        createAccountBtn.layer.cornerRadius = 27.5
        createAccountBtn.clipsToBounds = true
    }
    
    func setUpOrLabel() {
        orLbl.text = "OR"
        orLbl.font = UIFont.boldSystemFont(ofSize: 16)
        orLbl.textColor = UIColor.white
        orLbl.textAlignment = .center
    }
    
    func setUpTermsLabel() {
        termsOfServiceLbl.textColor = UIColor.white
        termsOfServiceLbl.font = UIFont.boldSystemFont(ofSize: 12)
        termsOfServiceLbl.text = "Terms of Service"
    }

}
