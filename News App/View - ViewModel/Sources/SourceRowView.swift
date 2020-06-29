//
//  SourceRow.swift
//  News App
//
//  Created by zafer ertas on 27.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import SwiftUI

struct SourceRowView: View {

    var source : Source
    
    var body: some View {
        NavigationLink(destination: SourceDetailsView(source: source)) {
            HStack {
                Text(source.name ?? "")
                    .font(.subheadline)
                    .frame(width: 100.0)
                Text(source.description ?? "")
                    .font(.subheadline)
            }
        }
    }
}

struct SourceRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            SourceRowView(source: sampleSourcesData[0])
            SourceRowView(source: sampleSourcesData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
