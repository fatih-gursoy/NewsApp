//
//  EndPoint.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 21.06.2022.
//

import Foundation

protocol EndPoint {
    var baseURL: String { get }
    var headers: [String:String] { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var url: URL? { get }
}

enum API: EndPoint {
    
    case everything
    case topHeadlines(country: String?, category: String?)
    
    var url : URL? {
        var components = URLComponents(string: baseURL)!
        components.path = path
        components.queryItems = queryItems
        guard let url = components.url else { fatalError() }
        return url
    }
    
    var baseURL: String {
      return "https://newsapi.org"
    }

    var headers: [String:String] {
        return ["X-API-Key": "9fd690aefd6f4cc389f4307bd4070151"]
    }
    
    var path: String {
        switch self {
        
        case .everything:
            return "/v2/everything"
            
        case .topHeadlines:
            return "/v2/top-headlines"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        
        switch self {
        
        case .topHeadlines(let country, let category):
            return [URLQueryItem(name: "country", value: country),
                    URLQueryItem(name: "category", value: category)]
            
        case .everything:
            break
        }
        return nil
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
