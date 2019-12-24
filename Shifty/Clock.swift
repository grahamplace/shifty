//
//  Clock.swift
//  Shifty
//
//  Created by Graham Place on 12/24/19.
//  Copyright © 2019 Graham Place. All rights reserved.
//

import Foundation

class Clock {
    func getTimeStr() -> String {
        return formatDateStr(formatStr: "HH:mm") + " UTC"
    }
    
    func getDateStr() -> String {
        return formatDateStr(formatStr: "EEEE, MMMM d, yyyy")
    }
    
    func formatDateStr(formatStr: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = formatStr
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }
}

