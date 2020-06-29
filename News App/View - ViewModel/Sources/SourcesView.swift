//
//  SourcesView.swift
//  News App
//
//  Created by zafer ertas on 21.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI

struct SourcesView: View {
    
    @ObservedObject var viewModel = SourcesViewModel()
    
    var body: some View {
        NavigationView {
            SourcesListView(state: viewModel.state)
            .navigationBarTitle(Text("Sources"))
        }
    }
}

struct SourcesView_Previews: PreviewProvider {
    static var previews: some View {
        SourcesView()
    }
}
