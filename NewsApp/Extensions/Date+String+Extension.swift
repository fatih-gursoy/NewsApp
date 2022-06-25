//
//  String+Extension.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 24.06.2022.
//

import Foundation


extension String {
    
    func convertedDate() -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self)
        
    }
}

extension Date {
    
    func dateToSring() -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: self)
        
    }
    
    
}
