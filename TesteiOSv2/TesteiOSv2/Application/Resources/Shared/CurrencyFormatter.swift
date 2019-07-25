//
//  CurrencyFormatter.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 23/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
struct CurrencyFormatter {
    static var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = Locale(identifier: "pt-BR").currencySymbol
        return formatter
    }
    
    static func real(value: Double) -> String {
        return formatter.string(from: NSNumber(value: value)) ?? "R$ ..."
    }
}

