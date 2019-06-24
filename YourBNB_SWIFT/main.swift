//
//  main.swift
//  YourBNB_SWIFT
//
//  Created by Drew on 2019-06-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation





print("--------------------> Welcome To Your BNB <--------------------")
print("Note: Choose The Options Below to Cancel anytime just type \"exit\"\nThis is the command line utility for the project YourBNB_Swift availabale at https://www.github.com/narangkishore98/YourBNB_Swift")


mainloop: while true
{
    print("\n\n--------------------------------------")
    print("1. View Users")
    print("2. View Properties")
    print("3. Add User")
    print("4. Add Property")
    print("5. Book A Property")
    print("6. Read Data From JSON")
    print("7. Save Data To JSON")
    print("\n\nPlease Enter Your Choice: ", terminator: "")
    let firstInput = readLine()!
    
    print("Thanks For Responding with option \(firstInput)")

    switch firstInput
    {
    case "exit":
        break mainloop
    case "1":
        print("1. View Users -> -> -> ")
        if DataStore.users.count == 0
        {
            print("No Users Availabe. Please try users adding first. Thanks.")
        }
        else
        {
            print("------------------------------------------------------")
            for user in DataStore.users
            {
                print("User Details ----------------------> ")
                print(user.display())
            }
            print("------------------------------------------------------")
        }
    case "2":
        print("2. View Properties -> -> ->")
        if DataStore.properties.count == 0
        {
            print("No Properties Available. Please Try adding properties first. Thanks")
        }
        else
        {
            print("------------------------------------------------------")
            for property in DataStore.properties
            {
                print("Property Details ----------------------> ")
                print(property.display())
            }
            print("------------------------------------------------------")
        }
    case "3":
        
        print("3. Add User -> -> -> ")
        print("Please Provide Your Personal Details: ")
        print("Please Enter Your First Name: ", terminator:"")
        let userFirstName = readLine()!
        print("Please Enter Your Last Name: ", terminator:"")
        let userLastName = readLine()!
        print("Please Select Your Gender (M/F/O): ", terminator:"")
        let userGender = readLine()!
        var tempGender:Gender = Gender.Other
        genderloop: while true
        {
            switch userGender
            {
                case "M":
                    tempGender = Gender.Male
                    break genderloop
                case "F":
                    tempGender = Gender.Female as Gender
                    break genderloop
            
                case "O":
                    tempGender = Gender.Other as Gender
                    break genderloop
                default:
                    print("The Gender Initial Was Invalid Try Again with options M: Male, F: Female, O: Others")
            
            }
        }
        print("Please Enter The Email ID: ", terminator:"")
        let email = readLine()!
        print("Please Enter The Mobile Number: ", terminator:"")
        let mobile = Int64(readLine()!)!
        print("Please Enter Your Password: ", terminator:"")
        let password = readLine()!
        let user:User = User(userID: "XXX Fill Aything if you want to add user by your own. you will have to set the importUser = true if you want this from json", firstName: userFirstName, lastName: userLastName, gender: tempGender, email: email, mobile: mobile, password: password)
        DataStore.users.append(user)
        
        
    case "4":
        print("4. Add Property -> -> -> ")
        useridgetter: while true
        {
            print("Please Enter Your User ID: ", terminator:"")
            let userid = readLine()!
            if let user = DataStore.getUser(userID: userid)
            {
                userpasswordgetter: while true
                {
                    print("Please Enter Your Password: ", terminator:"")
                    let password = readLine()!
                    if password == user.password
                    {
                        print("Please Enter the Property Name (Hit enter to leave blank.): ", terminator:"")
                        let propertyName = readLine()!
                        print("Please Enter Room Count: ", terminator:"")
                        let roomCount = Int(readLine()!)!
                        print("Please Enter Max People Count: ", terminator:"")
                        let maxPeopleCount = Int(readLine()!)!
                        print("Please Enter Price (Per Person): ", terminator:"")
                        let perPersonPrice = Float(readLine()!)!
                        print("Please Enter Total Price: ", terminator:"")
                        let totalPrice = Float(readLine()!)!
                        
                        var tempPropertyType:PropertyType = PropertyType.Apartment
                        propertytypeloop: while true
                        {
                            print("Please Enter The Property Type [A/B/C/H]: ")
                            let propertyType = readLine()!
                            switch(propertyType)
                            {
                            
                            case "A":
                                tempPropertyType = PropertyType.Apartment
                                break propertytypeloop
                            case "B":
                                tempPropertyType = PropertyType.Basement
                                break propertytypeloop
                            case "C":
                                tempPropertyType = PropertyType.Condominium
                                break propertytypeloop
                            case "H":
                                tempPropertyType = PropertyType.House
                                break propertytypeloop
                            case "exit":
                                break useridgetter
                            default:
                                print("Invalid Property Type. Please Choose from A: Apartment, B: Basement, C: Condominuium, H: House. To cancel anytime type \"exit\".")
                            }
                        }
                        print("Provide Address Details: -> -> ->")
                        print("Please Enter Street Name With Number (eg. 100 Mornelle Court.): ", terminator: "")
                        let street = readLine()!
                        print("Please Enter Apt. Number (Hit Enter to Skip): ", terminator: "")
                        let aptNo = readLine()
                        
                        var tempCity:City = City.Toronto
                        cityloop: while true
                        {
                            print("Please Enter The City (T/M): ", terminator: "")
                            let city = readLine()!
                            switch(city)
                            {
                            case "T":
                                tempCity = City.Toronto
                                break cityloop
                            case "M":
                                tempCity = City.Montreal
                                break cityloop
                            case "exit":
                                break useridgetter
                            default:
                                print("Incorrect City. Please Try with options T: Toronto, M: Montreal. To exit anytime type \"exit\" and hit enter.")
                            }
                        }
                        print("Please Enter The State: ")
                        let state = readLine()!
                        print("Please Enter PINCODE: ")
                        let pincode = readLine()!
                        let address:Address = Address(city: tempCity, state: state, aptNo: aptNo, pincode: pincode, street: street)
                        
                        let property:Property = Property(propertyID: "Type Anything as it won't work unless we set importProperty=true", propertyType: tempPropertyType, address: address, totalRooms: roomCount, maxPeopleAllowed: maxPeopleCount, pricePerPerson: perPersonPrice, totalPrice: totalPrice, isAvailable: true)
                        property.propertyName = propertyName
                        DataStore.properties.append(property)
                        DataStore.createdBy[userid] = property
                    }
                    else if password == "no password"
                    {
                        break useridgetter
                    }
                    else
                    {
                        print("Incorrect Password. Please try Again. [Cancel Anytime by just typing \"no password\"")
                    }

                }
            }
            else if (userid == "exit")
            {
                break useridgetter
            }
            else
            {
                print("User with \(userid) Does not exist please try agian.")
            }
                    
           
            
        }
    case "5":
        if DataStore.properties.count ==  0
        {
            print("No Properties Available to book.")
        }
        else{
            print("Choose Any of these properties to book.")
            for property in DataStore.properties
            {
                print(property.smallDisplay())
            }
            
            propertybooker : while true{
                print("--> Please Enter the property ID to book: ", terminator:"")
                let propertyID = readLine()!
                if  let property = DataStore.getProperty(propertyID: propertyID)
                {
                    print("You are gonna book the following property: ")
                    print("-------------------------------------------")
                    print(property.display())
                    print("Y and Enter to Continute or else N to go for another property.")
                    choicegetter: while true
                    {
                        let choice = readLine()!
                        switch(choice)
                        {
                        case "Y":
                            print("We Need The User Authentication, Please Enter Your USER ID: ")
                            usergetter: while true
                            {
                                
                            }
                        case "N":
                            print()
                            break choicegetter
                        default:
                            print("Please Choose Y/N: ", terminator:"")
                            
                        }
                    }
                }
                else if propertyID == "exit"
                {
                    break propertybooker
                }
                else{
                    print("Invalid Property ID. Type exit and hit enter to exit anytime.")
                }
            }
        }
    default:
        print("This Input Was Invalid Please try agian with the valid input: \"\(firstInput)\"")
    }
    
}

print("Thanks for using the command line utility of YourBNB_SWIFT")
