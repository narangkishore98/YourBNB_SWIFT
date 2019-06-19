//
//  Promo.swift
//  YourBNB_SWIFT
//
//  Created by Kishore Narang on 2019-06-19.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation

class Promo
{
    private var _promoCode:String
    var promoCode:String
    {
        set
        {
            _promoCode = newValue
        }
        get{
            return _promoCode.uppercased()
        }
    }
    private var promoDiscountPercent:Float
    var promoDescription:String
    init(promoCode:String, promoDescription:String, promoDiscountPercent:Float)
    
    {
            self._promoCode = promoCode
        self.promoDescription = promoDescription
        self.promoDiscountPercent = promoDiscountPercent
    }
    func getDiscountedPrice(price:Float) -> Float
    {
        return price - (price * promoDiscountPercent / 100)
    }
    
}
