//
//  Address.swift
//  YourBNB_SWIFT
//
//  Created by MacStudent on 2019-06-18.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation

struct Address: Display
{
    
    var city : City
    var state : String
    var aptNo : String?
    var pincode : String
    var street : String
    
    func display() -> String {
        return "\(aptNo ?? "")  \(street), \(city), \(state), CANADA - \(pincode)"
    }
    
    init()
    {
        self.city = City.Toronto
        self.state = ""
        self.aptNo = ""
        self.pincode =  ""
        self.street = ""
    }
    init(city: City, state: String, aptNo: String?, pincode: String, street: String)
    {
        self.city = city
        self.state = state
        self.aptNo = aptNo ?? ""
        self.pincode = pincode
        self.street = street
    }

}

