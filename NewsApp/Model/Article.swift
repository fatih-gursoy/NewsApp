//
//  News.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 21.06.2022.
//

import Foundation

struct Article: Codable, Identifiable {
    
    var id = UUID()
    let source: Source?
    let author, title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
    var imageURL: URL? {
        
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
    
    var date: String? {
        guard let date = publishedAt?.convertedDate() else {return ""}
        return date.dateToSring()
        
    }

}

// MARK: - Source
struct Source: Codable {
        let id, name: String?
}

struct Response: Codable {
    
    let articles: [Article]
    
}

extension Article {
    
    static var sampleData: Article {
        
        let article = Article(id: UUID(),
                             source: nil, author: "BBC News",
                             title: "White House unveils plans to reduce nicotine in cigarettes",
                             articleDescription: "The plan could dramatically reduce cancer deaths - a goal of President Joe Biden's",
                             url:"http://www.bbc.co.uk/news/world-us-canada-61887753",
                             urlToImage: "https://img.mlbstatic.com/mlb-images/image/private/t_2x1/t_w1536/mlb/kqu0ljr8z8kskta8kobr.jpg",
                             publishedAt: "2022-06-22T13:37:24.3427988Z",
                             content: "The amount of nicotine in cigarettes sold in the US is set to be reduced to minimal or non-addictive    levels.\r\nThe White House on Tuesday unveiled the plans which could dramatically reduce cancerasdasdasd,      asdasdasda House on Tuesday unveiled the plans which could dramatically reduce cancerasdasdasd")
        
        return article
        
    }
    
}
    

