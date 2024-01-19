//
//  SignInViewController.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/6/23.
//

import Foundation
import UIKit
import ProgressHUD

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var titleTextLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
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
        setUpBackground()
        setUpCloseBtn()
        setUpTitleTextLbl()
        setUpEmailTxt()
        setUpPasswordTxt()
        setUpSignInBtn()
        setUpSignUpBtn()
        setUpForgotPasswordBtn()
    }
    
    @IBAction func backBtnDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInBtnDidTap(_ sender: Any) {
        self.view.endEditing(true)
        self.validateFields()
        self.signIn(onSuccess: {
            //(UIApplication.shared.delegate as! AppDelegate).configureInitialViewController()
            // self.natigateToMainApp()
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
    }
    
    func signIn(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        ProgressHUD.show("Loading...")
        Api.User.signIn(email: self.emailTextField.text!, password: passwordTextField.text!, onSuccess: {
            ProgressHUD.dismiss()
            self.natigateToMainApp()
        }) { (errorMessage) in
            onError(errorMessage)
        }
    }
    
    @IBAction func signUpBtnDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUp = storyboard.instantiateViewController(withIdentifier: IDENTIFIER_SIGN_UP) as! SignUpViewController
        self.navigationController?.pushViewController(signUp, animated: true)
    }
    
    @IBAction func forgotPasswordBtnDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUp = storyboard.instantiateViewController(withIdentifier: IDENTIFIER_FORGOT_PASSWORD) as! ForgotPasswordViewController
        self.navigationController?.pushViewController(signUp, animated: true)
    }

    func validateFields() {
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_EMAIL)
            return
        }
        
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_PASSWORD)
            return
        }
    }
    
    func natigateToMainApp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainApp = storyboard.instantiateViewController(withIdentifier: IDENTIFIER_TABBAR)
        self.navigationController?.pushViewController(mainApp, animated: true)
    }
    
}
