//
//  Category.swift
//  News App
//
//  Created by zafer ertas on 24.06.2020.
//  Copyright © 2020 zafer ertas. All rights reserved.
//

import Foundation

enum Category: String, CaseIterable {
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
}

extension Category {
    var localizedDescription: String {
        switch self {
        case .general:
            return NSLocalizedString("Top Headlines", comment: "")
        case .business:
            return NSLocalizedString("Business", comment: "")
        case .entertainment:
            return NSLocalizedString("Entertainment", comment: "")
        case .health:
            return NSLocalizedString("Health", comment: "")
        case .science:
            return NSLocalizedString("Science", comment: "")
        case .sports:
            return NSLocalizedString("Sports", comment: "")
        case .technology:
            return NSLocalizedString("Technology", comment: "")
        }
    }
}
