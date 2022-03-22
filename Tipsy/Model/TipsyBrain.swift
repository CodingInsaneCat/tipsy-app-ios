//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Giovanni on 21/03/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    var total: Coast?
    
    mutating func calcuteTip(bill: String, persons: String, calculateTip: Double ) {
        print(!bill.isEmpty)
        //if let myBill = bill, !myBill.isEmpty {
        let doubleConvertedBill = Double(bill.replacingOccurrences(of: ",", with: "."))!
        let doubleConvertedPersons = Double(persons)!
        let calculatedTipPerPerson = (doubleConvertedBill / doubleConvertedPersons) * calculateTip
        let totalCoastPerPerson = (doubleConvertedBill / doubleConvertedPersons) + calculatedTipPerPerson
        
        let totalCoastPerPersonConverted = String(format: "%.2f",totalCoastPerPerson)
        let person2 = String(persons)
            total = Coast(billC: totalCoastPerPersonConverted,personsC: person2,tipC: calculateTip)
            
        
        
    }
    
    func getCoastTotal() -> String {
        let coastTo0DecimalPlace = total?.billC
        return coastTo0DecimalPlace!
       
    }
    
    func getTotalPersons() -> String{
        return total!.personsC
    }
    
    func getPercentTip() -> Double{
        let stringFormatted = String(format: "%.0f", total!.tipC * 100)
        return Double(stringFormatted)!
    }
}
