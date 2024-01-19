//
//  ForgotPasswordViewController.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/6/23.
//

import Foundation
import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var titleTextLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setUpUI() {
        setUpCloseBtn()
        setUpBackground()
        setUpTitleTextLbl()
        setUpEmailTextField()
        setUpResetBtn()
    }
    
    @IBAction func closeBtnDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func passwordBtnDidTap(_ sender: Any) {
        Api.User.resetPassword(email: self.emailTextField.text!, onSuccess: { print(SUCCESS_EMAIL_RESET)
        }) { (errorMessage) in
            print(errorMessage)
        }
    }
}
