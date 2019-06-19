//
//  Property.swift
//  YourBNB_SWIFT
//
//  Created by Drew on 2019-06-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
enum PropertyType
{
    case Apartment, Condominium, House, Basement
}
class Property : Display
{
    var propertyID:String //CXXX or OXXX
    var propertyName:String? //SkyView Manor if appartments not mandatory to give
    var totalRooms:Int //represents number of rooms available in home
    var maxPeopleAllowed:Int // represents maximum number of people allowed in home.
    var pricePerPerson:Float // if only one person is comming what will be the price for individual
    var totalPrice:Float // price for the whole property
    var isAvailable:Bool // if the property is available for rent at the current time or not.
    var address:Address
    var propertyType:PropertyType
    init(propertyID:String, propertyType:PropertyType, address:Address, totalRooms:Int , maxPeopleAllowed:Int, pricePerPerson:Float, totalPrice:Float, isAvailable:Bool )
    
    {
        self.propertyID = propertyID
        self.address = address
        self.propertyType = propertyType
        self.totalRooms = totalRooms
        self.maxPeopleAllowed = maxPeopleAllowed
        self.isAvailable = isAvailable
        self.pricePerPerson = pricePerPerson
        self.totalPrice = totalPrice
    
    }
    func display() -> String {
        var returner = "Property ID: \(self.propertyID)\n"
        if let p_name = propertyName 
        {
            returner += "Property Name: \(p_name)\n"
            
        }
        
        returner += "Property Type: \(propertyType)\n" +
        "Total Number of Rooms: \(self.totalRooms)\n" +
        "Max People Allowed: \(self.maxPeopleAllowed)\n" +
        "Price (Per Person):  \(self.pricePerPerson)\n" +
        "Price (Total): \(self.totalPrice)\n" +
        "Available: \( isAvailable ? "Yes":"No")\n" +
        "Address: \(address.display())"
        
        return returner
        
    }
    
}


