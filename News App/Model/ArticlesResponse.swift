//
//  Models.swift
//  News App
//
//  Created by zafer ertas on 17.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation
struct ArticlesResponse: Decodable {
    let status: String
    let totalResults: Int
    let message: String?
    let articles: [Article]
}



