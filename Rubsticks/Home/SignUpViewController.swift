//
//  SignUpViewController.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/6/23.
//

import Foundation
import UIKit
import ProgressHUD

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var titleTextLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    
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
        setUpEmailTxt()
        setUpPasswordTxt()
        setUpSignUpBtn()
        setUpSignInBtn()
    }
    
    @IBAction func closeBtnDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInBtnDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signIn = storyboard.instantiateViewController(withIdentifier: IDENTIFIER_SIGN_IN) as! SignInViewController
        self.navigationController?.pushViewController(signIn, animated: true)
    }
    
    @IBAction func createAccountBtnDidTap(_ sender: Any) {
        self.view.endEditing(true)
        self.validateFields()
        ProgressHUD.show("Loading...")
        Api.User.createAccount(email: self.emailTextField.text!, password: self.passwordTextField.text!, onSuccess: {
            ProgressHUD.dismiss()
            // (UIApplication.shared.delegate as! AppDelegate).configureInitialViewController()
            self.natigateToMainApp()
        }) { (errorMessage) in
            print(errorMessage)
        }
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
