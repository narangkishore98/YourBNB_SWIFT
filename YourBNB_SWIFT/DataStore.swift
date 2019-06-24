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
    static func readUsersFromJSON(fileName:String) -> [User]
    {
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        
        guard let jsonData = url else{
            print("url is nil")
            return Array()
        }
        
        guard let data = try? Data(contentsOf: jsonData) else {
            print("cannot convert the data")
            return Array()
        }
     
        guard let json = try? JSONSerialization.jsonObject(with: data, options: [])else{ return Array<User>() }
        
        print(json)
        
        
        
        
        
        return Array<User>()
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
}
