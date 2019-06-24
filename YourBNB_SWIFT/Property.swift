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
    static var propertyIDGenerator = 1
    var propertyID:String //CXXX or OXXX
    var propertyName:String? //SkyView Manor if appartments not mandatory to give
    var totalRooms:Int //represents number of rooms available in home
    var maxPeopleAllowed:Int // represents maximum number of people allowed in home.
    var pricePerPerson:Float // if only one person is comming what will be the price for individual
    var totalPrice:Float // price for the whole property
    var isAvailable:Bool // if the property is available for rent at the current time or not.
    var address:Address
    var importProperty:Bool = false
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
        if !importProperty
        {
            self.propertyID = "\(Property.propertyIDGenerator)".leftPadding(toLength: 4, withPad: "0")
            Property.propertyIDGenerator += 1
        }
    
    }
    
    init(property:Property)
    {
        self.propertyType = property.propertyType
        self.propertyID = property.propertyID
        self.propertyName = property.propertyName
        self.totalRooms = property.totalRooms
        self.address = property.address
        self.maxPeopleAllowed = property.maxPeopleAllowed
        self.pricePerPerson = property.pricePerPerson
        self.isAvailable = property.isAvailable
        self.totalPrice = property.totalPrice
    }
    init()
    {
        self.propertyID = ""
        self.propertyName = ""
        self.totalRooms = 0
        self.propertyType = PropertyType.Apartment
        self.maxPeopleAllowed = 0
        self.isAvailable = false
        self.pricePerPerson = 0
        self.totalPrice = 0
        self.address = Address()
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
        "Price (Per Person):  \(self.pricePerPerson.currency())\n" +
        "Price (Total): \(self.totalPrice.currency())\n" +
        "Available: \( isAvailable ? "Yes":"No")\n" +
        "Address: \(address.display())"
        
        return returner
        
    }
    func smallDisplay() -> String
    {
        return "ID: \(propertyID) - \(propertyName ?? "") \(address.street) - \(address.city) \(address.state) ($\(totalPrice) "
    }
    
}

class BookableProperty : Property
{
    var bookingDate:Date
    var checkInDate:Date
    var checkOutDate:Date
    var promoApplied:Bool

    var promo:Promo?
    var pricePaid:Float
    init(bookingDate:Date, checkInDate:Date, checkOutDate:Date, promoApplied:Bool, property:Property )
    {
        self.bookingDate = bookingDate
        self.checkInDate = checkInDate
        self.checkOutDate = checkOutDate
        self.promoApplied = promoApplied
   
        self.pricePaid = promo?.getDiscountedPrice(price: property.totalPrice) ?? property.totalPrice
        super.init(property: property)
    }
    override func display() -> String {
        return super.display() +
        "-------------Booking Details--------------\n" +
        "Booking Date: \(bookingDate)\n" +
        "Checkin Date: \(checkInDate)\n" +
        "Checkout Date: \(checkOutDate)" +
        "PromoCode Applied: \(promo?.promoCode ?? "None" )\n" +
        "Price Paid (Per Day): \(pricePaid.currency())"
    }
}
