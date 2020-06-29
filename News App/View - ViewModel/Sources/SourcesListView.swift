//
//  SourcesListView.swift
//  News App
//
//  Created by zafer ertas on 29.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI

struct SourcesListView: View {
    
    var state: LoadingState<Source>
    
    var body: some View {

        switch state {
            case .idle:
                //show nothing
                return AnyView(Text(""))
            case .loading:
                 return AnyView(Text("Loading...")
                    .font(.title))
            case .loaded(let sources ):
                return AnyView(list(of: sources))
            case .error(let error):
                 return AnyView(Text(error.localizedDescription)
                    .multilineTextAlignment(.center))
            }
    }
    
    private func list(of sources: [Source]) -> some View {
        
        return  List {
            ForEach(sources) { source in
                    SourceRowView(source: source)
            }
        }
    }
}

struct SourcesListView_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            SourcesListView(state: LoadingState.loaded(items: sampleSourcesData))
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
        
        
    }
}
