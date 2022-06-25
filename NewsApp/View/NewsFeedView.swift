//
//  ContentView.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 21.06.2022.
//

import SwiftUI

struct NewsFeedView: View {
    
    @StateObject private var viewModel = NewsViewModel()
    @State var selected = Country.tr
    
    var body: some View {
        
        TabView {
            
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
                
            }.onAppear {
                viewModel.fetchNews(selected)
                
            }
            .tabItem {
                Image(systemName: "list.dash")
                Text("Discover")
            }
            
            NavigationView {
                
                VStack {
                    
                    Text("News for Top Categories")
                        .bold()
                        .font(.title)
                    Spacer()
                }
                
                
                .navigationBarTitleDisplayMode(.inline)
            }
            
            .tabItem {
                Image(systemName: "star.fill")
                Text("Categories")
            }
            
            NavigationView {
                
                VStack {
                    
                    
                }
                .navigationTitle("")
            }
            .tabItem {
                Image(systemName: "magnifyingglass.circle")
                Text("Search")
            }
            
            NavigationView {
                
            }
            .tabItem {
                Image(systemName: "bookmark.circle.fill")
                Text("Bookmarks")
            }
            
        }
        
        
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
            .previewInterfaceOrientation(.portrait)
    }
}

struct SegmentedPickerView: View {
    
    @Binding var selected: Country
    
    var body: some View {
        Picker("Country", selection: $selected) {
            
            ForEach(Country.allCases, id: \.self) { country in
                Text(country.description)
                    .tag(country.description)
            }
        }.pickerStyle(.segmented)
    }
}
