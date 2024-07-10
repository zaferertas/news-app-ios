//
//  MainListView.swift
//  News App
//
//  Created by zafer ertas on 17.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI

struct TopHeadlinesView: View {
    
    @ObservedObject var viewModel = TopHeadlinesViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Picker(selection: $viewModel.category, label: Text("Category")) {
                        ForEach(Category.allCases, id: \.self) {
                            Text(String(describing: $0))
                        }
                    }
                    
                    Picker(selection: $viewModel.country, label: Text("Country")) {
                        ForEach(Country.allCases, id: \.self) {
                            Text(String(describing: $0))
                        }
                    }
                }.frame(maxHeight: 96) // TODO make form not scrollable and fit

                ArticlesListView(state: viewModel.state)
            }.navigationBarTitle(viewModel.category.localizedDescription)
            
        }
        .onAppear { self.viewModel.loadNews() }
    }

}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        TopHeadlinesView()
    }
}
