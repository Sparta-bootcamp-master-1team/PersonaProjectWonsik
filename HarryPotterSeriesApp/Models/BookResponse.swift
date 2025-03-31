//
//  BookResponse.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//

import Foundation

struct BookResponse: Codable {
    let data: [BookData]
}

struct BookData: Codable {
    let attributes: Book
}
