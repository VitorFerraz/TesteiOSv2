//
//  DateFormatter+NetworkResponse.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
extension DateFormatter {
    static var networkRemoteDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}
