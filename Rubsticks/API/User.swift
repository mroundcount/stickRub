//
//  User.swift
//  Rubsticks
//
//  Created by Michael Roundcount on 6/7/23.
//

import Foundation

class User {
    var uid: String
    var email: String
    var status: String
    var createdDate: Double
    var lastLoginDate: Double
    var testTime: Int
    var testCloseTime: Double
    
    init(uid: String, email: String, status: String, createdDate: Double, lastLoginDate: Double, testTime: Int, testCloseTime: Double) {
        self.uid = uid
        self.email = email
        self.status = status
        self.createdDate = createdDate
        self.lastLoginDate = lastLoginDate
        self.testTime = testTime
        self.testCloseTime = testCloseTime
    }
    
    //The method that excepts the dictionary and turns it into the users varaible
    static func transformUser(dict: [String: Any]) -> User? {
        guard let email = dict["email"] as? String,
        let status = dict["status"] as? String,
        let createdDate = dict["createdDate"] as? Double,
        let lastLoginDate = dict["lastLoginDate"] as? Double,
        let uid = dict["uid"] as? String,
        let testTime = dict["testTime"] as? Int,
        let testCloseTime = dict["testCloseTime"] as? Double
        else {
            return nil
        }
        //assign all of the unwrapped data to the instnce user, and return the full user at the end
        let user = User (uid: uid, email: email, status: status, createdDate: createdDate, lastLoginDate: lastLoginDate, testTime: testTime, testCloseTime: testCloseTime)
        
        
        
        return user
    }
}

