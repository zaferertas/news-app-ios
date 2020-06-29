//
//  SearchView.swift
//  stocks
//
//  Created by Mohammad Azam on 12/22/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Search", text: $viewModel.searchString)
                        .font(.title)
                        .foregroundColor(Color.primary)
                        .padding(8)
                    
                    Spacer()
                }.foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(8)
                Spacer()
                ArticlesListView(state: viewModel.state)
            }.navigationBarTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
