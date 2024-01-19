//
//  SignUpViewController+UI.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/6/23.
//

import Foundation
import UIKit

extension SignUpViewController {

    func setUpBackground() {
        self.view.backgroundColor = UIColor.black
    }
 
    func setUpCloseBtn() {
        closeBtn.setImage(UIImage(named: "close-1"), for: .normal)
        closeBtn.backgroundColor = UIColor.gray
        closeBtn.layer.cornerRadius = 15
    }
    
    func setUpTitleTextLbl() {
        titleTextLbl.textColor = UIColor.white
        titleTextLbl.font = UIFont.boldSystemFont(ofSize: 22)
        titleTextLbl.text = "Sign Up"
    }
    
    func setUpEmailTxt() {
        emailContainerView.layer.borderWidth = 2
        emailContainerView.layer.borderColor = UIColor.green.cgColor
        emailContainerView.layer.cornerRadius = 27.5
        emailContainerView.clipsToBounds = true
        emailContainerView.backgroundColor = UIColor.clear
        emailTextField.borderStyle = .none
        let placeholderAttr = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor : UIColor.green])
        emailTextField.attributedPlaceholder = placeholderAttr
        emailTextField.textColor = UIColor.green
    }
    
    func setUpPasswordTxt() {
        //the encryption text should be done in storyboard
        passwordContainerView.layer.borderWidth = 2
        passwordContainerView.layer.borderColor = UIColor.green.cgColor
        passwordContainerView.layer.cornerRadius = 27.5
        passwordContainerView.clipsToBounds = true
        passwordContainerView.backgroundColor = UIColor.clear
        passwordTextField.borderStyle = .none
        let placeholderAttr = NSAttributedString(string: "Password (6+ Characters)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.green])
        passwordTextField.attributedPlaceholder = placeholderAttr
        passwordTextField.textColor = UIColor.green
    }
    
    func setUpSignUpBtn() {
        signUpBtn.setTitle("Sign Up", for: UIControl.State.normal)
        signUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        signUpBtn.backgroundColor = UIColor.white
        signUpBtn.layer.cornerRadius = 27.5
        signUpBtn.clipsToBounds = true
        signUpBtn.setTitleColor(.white, for: UIControl.State.normal)
        signUpBtn.backgroundColor = UIColor.green
        
    }
    
    func setUpSignInBtn() {
        // We're going to apply the key value UI attributed string to a UI button
        let attributedText = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor.white])
        
        let attributedSubText = NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.green])
        
        attributedText.append(attributedSubText)
        signInBtn.setAttributedTitle(attributedText, for: UIControl.State.normal)
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

    func textFieldShouldReturn(_ emailTxt: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldShouldReturnII(_ passwordTxt: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //Dismissing the keyboard. Looks for the repsonder to the text field to give up the statis.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
