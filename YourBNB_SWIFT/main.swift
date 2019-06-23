//
//  main.swift
//  YourBNB_SWIFT
//
//  Created by Drew on 2019-06-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation


var users = Array<User>()

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
        print("------------------------------------------------------")
        for user in users
        {
            print("User Details ----------------------> ")
            //user.display() // not made yet.
        }
        print("------------------------------------------------------")
    case "3":
        print("3. Add User -> -> -> ")
        print("Please Provide Your Personal Details: ")
        print("Please Enter Your First Name: ")
        let userFirstName = readLine()!
        print("Please Enter Your Last Name: ")
        let userLastName = readLine()
        print("Please Select Your Gender (M/F/O): ")
        var userGender = readLine()!
        genderloop: while true
        {
            switch userGender
            {
            case "M":
                userGender = Gender.Male
            }
            case "F":
            {
                userGender = Gender.Female
            }
            case "O":
            {
            
            }
        }
    default:
        print("This Input Was Invalid Please try agian with the valid input: \"\(firstInput)\"")
    }
}

print("Finished")
