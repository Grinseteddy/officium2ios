//
//  OfficiumUtilities.swift
//  Officium2
//
//  Created by Annegret Junker on 23.08.19.
//  Copyright © 2019 Annegret Junker. All rights reserved.
//

import Foundation

class OfficiumUtilities {
    
    static func CalculateProgress(StartDate: String, EndDate: String) -> Float {
        
        
        var startDateAsString:String = StartDate
        var endDateAsString:String = EndDate
        
        while startDateAsString.count>10 {
            startDateAsString.removeLast()
        }
        
        while endDateAsString.count>10 {
            endDateAsString.removeLast()
        }
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let startDate = dateFormatter.date(from: startDateAsString),let endDate=dateFormatter.date(from: endDateAsString) {
            let entire = Calendar.current.dateComponents([.day], from: startDate, to: endDate)
            print("All days:", entire.day as Any)
            let part = Calendar.current.dateComponents([.day], from: Date(), to: endDate)
            print("Part:", part.day as Any)
            let entireNumber: Float = Float(entire.day!)
            let partNumber: Float = Float(part.day!)
            return 1-partNumber/entireNumber
        } else {
                return 0.0
        }
    }
}
