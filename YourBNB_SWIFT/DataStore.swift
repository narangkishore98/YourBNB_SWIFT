//
//  DataStore.swift
//  YourBNB_SWIFT
//
//  Created by User on 2019-06-21.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
class DataStore
{
    
    static var users=Array<User>()
    static var properties=Array<Property>()
    static var createdBy:Dictionary<String,Property> = Dictionary<String, Property>()
    static var bookedBy:Dictionary<String, Property> = Dictionary<String, Property>()
    
    static func readUsersFromJSON(fileName:String)
    {
         //print("HELLO")
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        guard let jsonData = url else { return }
        guard let data = try? Data(contentsOf: jsonData) else { return }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: [])else{ return }
        //print("HELLO")
        //print(json)
        
        if let jsonArray = json as? [Any]
        {
            var user: User!
            for userObject in jsonArray
            {
                user = User()
                if let jsonDictionay =  userObject as? [String: Any]
                {
                    if let userID = jsonDictionay["userID"] as? String
                    {
                        //print(userID)
                        user.userID = userID
                    }
                    if let firstName = jsonDictionay["firstName"] as? String
                    {
                        //print(firstName)
                        user.firstName = firstName
                    }
                    if let lastName = jsonDictionay["lastName"] as? String
                    {
                        //print(lastName)
                        user.lastName = lastName
                    }
                    if let gender = jsonDictionay["gender"] as? String
                    {
                        //print(gender)
                        let userGender = gender
                        var tempGender:Gender = Gender.Other
                        genderloop: while true
                        {
                            switch userGender
                            {
                            case "M":
                                tempGender = Gender.Male
                                break genderloop
                            case "F":
                                tempGender = Gender.Female
                                break genderloop
                                
                            case "O":
                                tempGender = Gender.Other
                                break genderloop
                            default : print("ReadJson Gender Loop Error")
                            }
                        }
                        user.gender = tempGender
                    }
                    if let password = jsonDictionay["password"] as? String
                    {
                        //print(password)
                        user.password = password
                    }
                    if let email = jsonDictionay["email"] as? String
                    {
                        //print(email)
                        user.email = email
                    }
                    if let mobile = jsonDictionay["mobile"] as? String
                    {
                        //print(mobile)
                        user.mobile = Int64(mobile)!
                    }
                    if let isOwner = jsonDictionay["isOwner"] as? Bool
                    {
                        //print(isOwner)
                        user.isOwner = isOwner
                    }
                    if let ownedProperties = jsonDictionay["ownedProperties"] as? [String]
                    {
                        for propertyID in ownedProperties
                        {
                            createdBy[user.userID] = self.getProperty(propertyID: propertyID)
                            //print(propertyID)
                        }
                    }
                    if let bookedProperties = jsonDictionay["bookedProperties"] as? [Any]
                    {
                        
                        for propertyBook in bookedProperties
                        {
                            var property:Property? = nil
                            let df = DateFormatter()
                            df.dateFormat = "MM-dd-yyyy"
                            var checkindate:Date = Date()
                            var checkoutdate:Date = Date()
                            var bookingdate:Date = Date()
                            if let propertyObj =  propertyBook as? [String: Any]
                            {
                                if let propertyID = propertyObj["propertyID"] as? String
                                {
                                    //print(propertyID)
                                    property = getProperty(propertyID: propertyID)!
                                    //print(property?.display())
                                }
                                if let bookingDate = propertyObj["bookingDate"] as? String
                                {
                                    bookingdate = df.date(from:bookingDate)!
                                    //print(bookingdate)
                                }
                                if let checkinDate = propertyObj["checkinDate"] as? String
                                {
                                    checkindate = df.date(from: checkinDate)!
                                    //print(checkindate)
                                }
                                if let checkoutDate = propertyObj["checkoutDate"] as? String
                                {
                                    checkoutdate = df.date(from: checkoutDate)!
                                    ///print(checkoutdate)
                                }
                            }
                            let bookedproperty = BookableProperty(bookingDate: bookingdate, checkInDate: checkindate, checkOutDate: checkoutdate, promoApplied: false, property: property!  )
                            bookedBy[user.userID] = bookedproperty
                        }
                    }
                }
                //print(" ")
            }
            //print(" ")
            
        }
        //return Array<User>()
    }
    
    static func getUser(userID:String) -> User?
    {
        for user in users
        {
            if user.userID == userID
            {
                return user
            }
            
        }
        return nil
    }
    static func getProperty(propertyID:String) -> Property?
    {
        for property in properties
        {
            if property.propertyID == propertyID
            {
                return property
            }
            
        }
        return nil
    }
}
