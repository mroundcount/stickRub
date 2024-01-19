//
//  Ref.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/6/23.
//

import Foundation
import Firebase

//Storage and database references
let REF_USER = "users"

//User profile attributes
let UID = "uid"
let EMAIL = "email"
let STATUS = "status"
let CREATED_DATE = "createdDate"
let LAST_LOGIN_DATE = "lastLoginDate"

//App info for landing page
let IDENTIFIER_WELCOME = "WelcomeVC"
let IDENTIFIER_TABBAR = "TabBarVC"

//Viewcontroller references
let IDENTIFIER_SIGN_IN = "SignInViewController"
let IDENTIFIER_SIGN_UP = "SignUpViewController"
let IDENTIFIER_FORGOT_PASSWORD = "ForgotPasswordViewController"
let IDENTIFIER_WELCOME_HOME_PAGE = "WelcomeViewController"
let IDENTIFIER_HOME_FIRE = "HomeFireViewController"
let IDENTIFIER_GATHER = "GatherViewController"
let IDENTIFIER_ACCOUNT = "AccountViewController"

//Error handling
let ERROR_EMPTY_EMAIL = "Please enter an email address"
let ERROR_EMPTY_PASSWORD = "Please enter a password"
let ERROR_EMPTY_EMAIL_RESET = "Please enter an email address to reset your password"
let SUCCESS_EMAIL_RESET = "We have just resent you a password. Please check your inbox"


class Ref {
    let databaseRoot: DatabaseReference = Database.database().reference()
    
    var databaseUsers: DatabaseReference {
        return databaseRoot.child(REF_USER)
    }
    
    //method for taking a user id as a parameter to get the reference node
    func databaseSpecificUser(uid: String) -> DatabaseReference {
        return databaseUsers.child(uid)
    }
 }


