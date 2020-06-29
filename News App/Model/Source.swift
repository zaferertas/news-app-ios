//
//  Source.swift
//  News App
//
//  Created by zafer ertas on 27.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation

struct Source: Hashable, Decodable, Identifiable {
    let id: String?
    let name: String?
    let description: String?
    let country: String?
    let category: String?
    let url: String?
}
