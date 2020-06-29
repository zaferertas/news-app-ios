//
//  SourcesResponse.swift
//  News App
//
//  Created by zafer ertas on 27.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation

struct SourcesResponse: Decodable {
    let status: String
    let sources: [Source]
}
