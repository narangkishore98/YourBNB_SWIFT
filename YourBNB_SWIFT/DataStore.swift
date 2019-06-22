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
    static func readUsersFromJSON(fileName:String) -> [User]
    {
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        guard let jsonData = url else { }
        guard let data = Data(contentsOf: jsonData) else {}
        
        
        return Array<User>()
    }
}
