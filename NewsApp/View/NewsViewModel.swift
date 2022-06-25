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
    
    init(service: NetworkManager = NetworkManager.shared) {
        self.service = service
    }
    
    @Published var articles: [Article] = []
    
    func fetchNews(_ byCountry: Country) {
        
        service.fetchData(endPoint: EndPoint.topHeadlines(country: byCountry)) { (result: Response) in
            
            self.articles = result.articles
            
        }
    }
    
    

    
}
