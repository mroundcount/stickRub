//
//  Account.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/7/23.
//

import Foundation
import UIKit

class AccountViewController : UIViewController {
    
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var welcomeLbl: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        observeProfileData()
    }
    
    func setUpUI() {
        setUpBackground()
        setUpWelcomeLabel()
        setUpLogoutBtn()
    }
    
    
    @IBAction func logoutBtnTapped(_ sender: Any) {
        print("logout Tapped")
        Api.User.logOut()
        natigateToHome()
    }
    
    func natigateToHome() {
        print("In function")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home = storyboard.instantiateViewController(withIdentifier: IDENTIFIER_WELCOME_HOME_PAGE) as! WelcomeViewController
        self.navigationController?.pushViewController(home, animated: true)
    }
    
    func observeProfileData() {
        Api.User.getUserInforSingleEvent(uid: Api.User.currentUserId) { (user) in
            print(user.email)
            self.welcomeLbl.text = "\(user.email)"
        }
    }
}
