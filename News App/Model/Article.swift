//
//  Article.swift
//  News App
//
//  Created by zafer ertas on 27.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation

struct Article: Decodable, Identifiable  {
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt : String
    let content: String?
}
