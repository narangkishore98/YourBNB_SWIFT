//
//  main.swift
//  YourBNB_SWIFT
//
//  Created by Drew on 2019-06-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation

var u:User = User(userID:"C019", firstName:  "Kishore" , lastName:"Narang", gender: Gender.Male, email:"narangkishore98@gmail.com", mobile: 6477639826, password:"Hello@123" )
var adr:Address = Address(city: City.Toronto, state: "Ontario", aptNo:nil, pincode:
    "m1e 4x2", street: "100 Mornelle Court")

var p:Property = Property(propertyID: "A9090", propertyType: PropertyType.Basement, address: adr, totalRooms: 4, maxPeopleAllowed: 8, pricePerPerson: 20, totalPrice: 160, isAvailable: true)

try! u.addOwnedProperty(property: p)

