//
//  Currency.swift
//  YourBNB_SWIFT
//
//  Created by Kishore Narang on 2019-06-24.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
extension Float
{
    func currency() -> String
    {
        return "$\(self)"
    }
}
