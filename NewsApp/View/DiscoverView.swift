//
//  DiscoverView.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 25.06.2022.
//

import SwiftUI

struct DiscoverView: View {
    
    @StateObject private var viewModel = NewsViewModel()
    @State private var selected = Country.tr
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                SegmentedPickerView(selected: $selected)
                    .onChange(of: selected) { newValue in
                        viewModel.fetchNews(selected)
                    }
                
                List {
                    ForEach(viewModel.articles) { article in
                        ArticleRowView(article: article)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Top News")
            }
            .onAppear {
                viewModel.fetchNews(selected)
            }
        }
        
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
