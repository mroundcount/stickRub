//
//  SignInViewController+UI.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/6/23.
//

import Foundation
import UIKit

extension SignInViewController {
    
    func setUpBackground() {
        self.view.backgroundColor = UIColor.black
    }
    
    func setUpCloseBtn() {
        closeBtn.setImage(UIImage(named: "close-1"), for: .normal)
        closeBtn.backgroundColor = UIColor.gray
        closeBtn.layer.cornerRadius = 15
    }
    
    func setUpTitleTextLbl() {
        titleTextLbl.textColor = UIColor.green
        titleTextLbl.font = UIFont.boldSystemFont(ofSize: 22)
        titleTextLbl.text = "Sign In"
    }
    
    func setUpEmailTxt() {
        emailContainerView.layer.borderWidth = 2
        emailContainerView.layer.borderColor = UIColor.green.cgColor
        emailContainerView.layer.cornerRadius = 27.5
        emailContainerView.clipsToBounds = true
        emailContainerView.backgroundColor = UIColor.clear
        emailTextField.borderStyle = .none
        
        let placeholderAttr = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.green])
        
        emailTextField.attributedPlaceholder = placeholderAttr
        emailTextField.textColor = UIColor.green
    }
    
    func setUpPasswordTxt() {
        passwordContainerView.layer.borderWidth = 2
        passwordContainerView.layer.borderColor = UIColor.green.cgColor
        passwordContainerView.layer.cornerRadius = 27.5
        passwordContainerView.clipsToBounds = true
        passwordContainerView.backgroundColor = UIColor.clear
        passwordTextField.borderStyle = .none
        
        let placeholderAttr = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.green])
        
        passwordTextField.attributedPlaceholder = placeholderAttr
        passwordTextField.textColor = UIColor.green
    }
    
    func setUpSignInBtn() {
        signInBtn.setTitle("Sign In", for: UIControl.State.normal)
        signInBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        signInBtn.backgroundColor = UIColor.white
        signInBtn.layer.cornerRadius = 27.5
        signInBtn.clipsToBounds = true
        signInBtn.setTitleColor(.white, for: UIControl.State.normal)
        signInBtn.backgroundColor = UIColor.green
    }
    
    func setUpSignUpBtn() {
        //copy attributed string key values from SignUpViewController+UI
        let attributedText = NSMutableAttributedString(string: "Don't have an account? ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor.white])
        
        let attributedSubText = NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.green])
        
        attributedText.append(attributedSubText)
        signUpBtn.setAttributedTitle(attributedText, for: UIControl.State.normal)
    }
    
    func setUpForgotPasswordBtn() {
        forgotPasswordBtn.setTitle("Forgot Password", for: UIControl.State.normal)
        forgotPasswordBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        forgotPasswordBtn.setTitleColor(UIColor.green, for: .normal)
        forgotPasswordBtn.backgroundColor = UIColor.clear
        forgotPasswordBtn.layer.borderWidth = 2
        forgotPasswordBtn.layer.cornerRadius = 15
        forgotPasswordBtn.clipsToBounds = true
        forgotPasswordBtn.layer.borderColor = UIColor.green.cgColor
    }
    
    func setUpKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        //Setting up the keyboard to dismiss
        emailTextField.returnKeyType = UIReturnKeyType.done
        self.emailTextField.delegate = self
        passwordTextField.returnKeyType = UIReturnKeyType.done
        self.passwordTextField.delegate = self
    }
    
    //Moving up the keyboard
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -75 // Move view x points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }

    func textFieldShouldReturn(_ emailTextField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldShouldReturnII(_ passwordTextField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //Dismissing the keyboard. Looks for the repsonder to the text field to give up the statis.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
