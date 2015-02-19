//
//  TipCalc.swift
//  TipCalc
//
//  Created by Matthew Brightbill on 2/19/15.
//  Copyright (c) 2015 Matthew Brightbill. All rights reserved.
//

import Foundation

class TipCalc {
    
    var tipAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    
    init(amountBeforeTax:Float, tipPercentage:Float) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() {
        tipAmount = self.amountBeforeTax * self.tipPercentage
    }
}