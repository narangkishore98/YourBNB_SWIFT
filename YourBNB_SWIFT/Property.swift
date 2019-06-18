//
//  Property.swift
//  YourBNB_SWIFT
//
//  Created by Drew on 2019-06-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
class Property
{
    var propertyID:String //CXXX or OXXX
    var propertyName:String? //SkyView Manor if appartments not mandatory to give
    var totalRooms:Int //represents number of rooms available in home
    var maxPeopleAllowed:Int // represents maximum number of people allowed in home.
    var pricePerPerson:Float // if only one person is comming what will be the price for individual
    var totalPrice:Float // price for the whole property
    var isAvailable:Bool // if the property is available for rent at the current time or not.
    var address:Address
    init(propertyID:String, address:Address, totalRooms:Int , maxPeopleAllowed:Int, pricePerPerson:Float, totalPrice:Float, isAvailable:Bool )
    
    {
        self.propertyID = propertyID
        self.address = address
        self.totalRooms = totalRooms
        self.maxPeopleAllowed = maxPeopleAllowed
        self.isAvailable = isAvailable
        self.pricePerPerson = pricePerPerson
        self.totalPrice = totalPrice
    
    }
}
