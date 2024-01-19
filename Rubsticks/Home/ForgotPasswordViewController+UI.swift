//
//  ForgotPasswordViewController+UI.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/6/23.
//

import Foundation
import UIKit

extension ForgotPasswordViewController {
    
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
        titleTextLbl.text = "Reset Password"
    }
    
    func setUpEmailTextField() {
        self.emailContainerView.layer.borderWidth = 2
        self.emailContainerView.layer.borderColor = UIColor.green.cgColor
        self.emailContainerView.layer.cornerRadius = 27.5
        self.emailContainerView.clipsToBounds = true
        self.emailContainerView.backgroundColor = UIColor.clear
        self.emailTextField.borderStyle = .none
        let placeholderAttr = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor : UIColor.green])
        self.emailTextField.attributedPlaceholder = placeholderAttr
        self.emailTextField.textColor = UIColor.green
        
    }
    func setUpResetBtn() {
        resetBtn.setTitle("Reset My Password", for: UIControl.State.normal)
        resetBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        resetBtn.backgroundColor = UIColor.white
        resetBtn.layer.cornerRadius = 27.5
        resetBtn.clipsToBounds = true
        resetBtn.setTitleColor(.white, for: UIControl.State.normal)
        resetBtn.backgroundColor = UIColor.green
    }
    
    func setUpKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        //Setting up the keyboard to dismiss
        emailTextField.returnKeyType = UIReturnKeyType.done
        self.emailTextField.delegate = self
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
    
    //Dismissing the keyboard. Looks for the repsonder to the text field to give up the statis.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
