//
//  ContentView.swift
//  News App
//
//  Created by zafer ertas on 21.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TopHeadlinesView()
                .tabItem {
                    Image (systemName: "star")
                    Text("Top Headlines")
            }
            SearchView()
                .tabItem {
                    Image (systemName: "magnifyingglass")
                     Text("Search")
            }
            SourcesView()
                .tabItem {
                    Image (systemName: "dot.radiowaves.left.and.right")
                     Text("Sources")
            }

        }
        .accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
