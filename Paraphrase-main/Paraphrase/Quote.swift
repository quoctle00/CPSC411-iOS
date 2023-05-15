//
//  Quote.swift
//  Paraphrase
//
//

import UIKit

struct Quote: Codable, Comparable {
    var author: String
    var text: String

    static func <(lhs: Quote, rhs: Quote) -> Bool {
        return lhs.author < rhs.author
    }
}
