//
//  ContentView.swift
//  NewsApp
//
//  Created by Fatih Gursoy on 21.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        TabView {
            
            DiscoverView().tabItem {
                Image(systemName: "list.dash")
                Text("Discover")
            }
            
            CategoryView().tabItem {
                Image(systemName: "star.fill")
                Text("Categories")
            }
            
            NavigationView {
                
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

struct HomeViewView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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
