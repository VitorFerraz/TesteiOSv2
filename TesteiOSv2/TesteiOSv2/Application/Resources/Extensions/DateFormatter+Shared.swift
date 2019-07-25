//
//  DateFormatter+Shared.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
extension DateFormatter {
    static var sharedDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()
}

