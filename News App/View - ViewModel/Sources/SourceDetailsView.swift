//
//  SourceDetailsView.swift
//  News App
//
//  Created by zafer ertas on 27.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI

struct SourceDetailsView: View {
    
    var source : Source
    
    @State var shouldPresent: Bool = false
    @State var sourceURL: URL?
    
    var body: some View {
        VStack(alignment: .leading) {

            Text(source.name ?? "")
            .font(.title)
            Text(source.category ?? "")
            Text(source.country ?? "")
            Text(source.description ?? "")
            Button(
                action: {
                    self.sourceURL = URL(string:self.source.url!)
                    self.shouldPresent = true
                },
                label: {
                     Text(source.url ?? "")
                    .foregroundColor(Color.blue)
                }
            )
        }
        .sheet(isPresented: $shouldPresent) {WebView(url: self.sourceURL!)}
        .padding(20)
        .navigationBarTitle(Text(source.id!), displayMode: .inline)
    }
}

struct SourceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SourceDetailsView(source: sampleSourcesData[0])
    }
}
