//
//  AuthorizationError.swift
//  YourBNB_SWIFT
//
//  Created by Kishore Narang on 2019-06-19.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
enum AuthorizationError : Error
{
    case invalidUserType(type:String)
    case invalidEmailError
}
