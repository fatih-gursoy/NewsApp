//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 21.06.2022.
//

import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    
    private let service: NetworkProtocol
    
    init(service: NetworkProtocol = NetworkManager.shared) {
        self.service = service
    }
    
    @Published var articles: [Article] = []
    
    func fetchNews(byCountry: Country?, byCategory: Category? = nil) {
        
        service.fetchData(endPoint: API.topHeadlines(country: byCountry?.rawValue,
                                                     category: byCategory?.rawValue)) { (result: Response) in
            
            self.articles = result.articles
            
        }
    }
    
    

    
}
