//
//  User.swift
//  YourBNB_SWIFT
//
//  Created by Kishore Narang on 2019-06-18.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation

enum Gender
{
    case Male,Female,Other
}

struct User
{
    var userID:String // CXXX or OXXX depending upon user type
    var firstName:String //First Name
    var lastName:String // Last Name
    var gender : Gender
    var password:String
    var fullName:String{
        return firstName + "  " + lastName
    }
    var email : String // email@gmail.com
    var mobile:Int64
    var isOwner:Bool=false
    private var _ownedProperties:Array<Property> = Array<Property>()
    private var _bookedProperties:Array<BookableProperty> = Array<BookableProperty>()
    
    // methods and behaviours of the users depend upon the user type and may throw some errors when user type is not compatible
  
    init(userID:String ,firstName:String, lastName:String, gender : Gender, email:String, mobile:Int64, password:String)
        
    {
        self.userID = userID
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.email = email
        self.mobile = mobile
        self.password = password
    }
    mutating func addOwnedProperty(property:Property) throws
    {
        if !isOwner
        {
                throw AuthorizationError.invalidUserType(type: "CUSTOMER")
        }
        _ownedProperties.append(property)
    }
    
   
}
