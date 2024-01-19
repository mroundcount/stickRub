//
//  ViewController.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/6/23.
//

import UIKit
import FirebaseAuth
import Firebase

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var orLbl: UILabel!
    @IBOutlet weak var termsOfServiceLbl: UILabel!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLogIn()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setUpUI() {
        setUpBackground() 
        setUpHeaderTitle()
        setUpOrLabel()
        setUpCreateAccountBtn()
        setUpTermsLabel()
        setUpSignInBtn()
    }

    @IBAction func signInBtnDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signIn = storyboard.instantiateViewController(withIdentifier: IDENTIFIER_SIGN_IN) as! SignInViewController
        self.navigationController?.pushViewController(signIn, animated: true)
    }
    @IBAction func createAccountBtnDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUp = storyboard.instantiateViewController(withIdentifier: IDENTIFIER_SIGN_UP) as! SignUpViewController
        self.navigationController?.pushViewController(signUp, animated: true)
    }
    
    func checkLogIn(){
        if Auth.auth().currentUser != nil {
            updateLastLoginTime()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainApp = storyboard.instantiateViewController(withIdentifier: IDENTIFIER_TABBAR)
            self.navigationController?.pushViewController(mainApp, animated: true)
        }
    }
    
    func updateLastLoginTime() {
        Database.database().reference().root.child("users").child(Api.User.currentUserId).updateChildValues(["lastLoginDate":Date().timeIntervalSince1970])
    }
}

