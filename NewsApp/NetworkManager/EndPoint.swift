//
//  EndPoint.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 21.06.2022.
//

import Foundation


enum EndPoint {
    
    var baseUrl: String {
      return "https://newsapi.org/v2/"
    }

    var headers: [String:String] {
        return ["X-API-Key": "9fd690aefd6f4cc389f4307bd4070151"]
    }
    
    case everything
    case topHeadlines(country: Country)
    
}

extension EndPoint {
    
    var path: String {
        switch self {
        
        case .everything:
            return "everything?"
            
        case .topHeadlines(let country):
            return "top-headlines?country=\(country)"
        }
    }
}

enum Country: String, CaseIterable, Hashable, Equatable {
    
    case tr, gb, us, de
    
    var description: String {
        
        switch self {
        case .gb: return "England"
        case .de: return "Germany"
        case .tr: return "Türkiye"
        case .us: return "USA"
        }
    }
}

enum Category: String, CaseIterable, Hashable {
    
    case general, business, entertainment, health, science, sports, technology

    var description: String {
        
        switch self {
        case .general: return "General"
        case .business: return "Business"
        case .entertainment: return "Entertainment"
        case .health: return "Health"
        case .science: return "Science"
        case .sports: return "Sports"
        case .technology: return "Technology"
        }
    }
    
}
