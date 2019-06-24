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
    print("6. Show Future Bookings")
    print("7. Show Past Bookings")
    print("8. Read Data From JSON")
    print("9. Save Data To JSON")
    print("\n\nPlease Enter Your Choice: ", terminator: "")
    let firstInput = readLine()!
    
    print("Thanks For Responding with option \(firstInput)")

    switch firstInput
    {
    case "exit":
        break mainloop
    case "1":
        print("1. View Users -> -> -> ")
        if users.count == 0
        {
            print("No Users Availabe. Please try users adding first. Thanks.")
        }
        else
        {
            print("------------------------------------------------------")
            for user in users
            {
                print("User Details ----------------------> ")
                print(user.display())
            }
            print("------------------------------------------------------")
        }
    case "2":
        print("2. View Properties -> -> ->")
        if properties.count == 0
        {
            print("No Properties Available. Please Try adding properties first. Thanks")
        }
        else
        {
            print("------------------------------------------------------")
            for property in properties
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
        print("Please Enter Your Password", terminator:"")
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
                        print("Please Enter the Property Name: ", terminator:"")
                        let propertyName = readLine()!
                        print("Please Enter Room Count: ", terminator:"")
                        let roomCount = Int(readLine()!)
                        print("Please Enter Max People Count: ", terminator:"")
                        let maxPeopleCount = Int(readLine()!)
                        print("Please Enter Price ")
                        
                    }
                    else if password == "no password"
                    {
                        break useridgetter
                    }
                    else
                    {
                        print("Incorrect Password. Please try Again. [Cancel Anytime by just typing \"no password]\"")
                    }

                }
            }
            else
            {
                print("User with \(userid) Does not exist please try agian.")
            }
                    
           
            
        }
    default:
        print("This Input Was Invalid Please try agian with the valid input: \"\(firstInput)\"")
    }
    
}

print("Finished")
