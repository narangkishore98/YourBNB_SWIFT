//
//  User.swift
//  YourBNB_SWIFT
//
//  Created by Kishore Narang on 2019-06-18.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation

struct User
{
    var userID:String // CXXX or OXXX depending upon user type
    var firstName:String //First Name
    var lastName:String // Last Name
    var fullName:String{
        return firstName + "  " + lastName
    }
    var email : String // email@gmail.com
    var mobile:Int64
}
