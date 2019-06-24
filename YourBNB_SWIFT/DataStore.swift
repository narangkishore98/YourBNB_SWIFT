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
    static func readUsersFromJSON(fileName:String) -> [User]
    {
         print("HELLO")
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        guard let jsonData = url else { return [] }
        guard let data = try? Data(contentsOf: jsonData) else { return [] }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: [])else{ return [] }
        print("HELLO")
        print(json)
        
        
        
        
        
        return Array<User>()
    }
    
    static func readPropertiesFromJSON(fileName:String)
    {
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        guard let jsonData = url else { return }
        guard let data = try? Data(contentsOf: jsonData) else { return }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
        
        
        
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
