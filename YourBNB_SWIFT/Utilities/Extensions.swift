//
//  Extensions.swift
//  YourBNB_SWIFT
//
//  Created by Kishore Narang on 2019-06-22.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation

// reference from https://gist.github.com/mcinjection/1c3c8f6428c30e79cf8bc9679627b5b9
extension String {
    
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        
        let newLength = self.count
        
        if newLength < toLength {
            
            return String(repeatElement(character, count: toLength - newLength)) + self
            
        } else {
            
           // return self.substring(from: index(self.startIndex, offsetBy: newLength - toLength))
            
            return self
        }
    }
    
}


