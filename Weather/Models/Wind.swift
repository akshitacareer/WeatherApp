//
//  Wind.swift
//  Weather
//
//  Created by Akshita Patel on 09/22/23.
//

import Foundation

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int?
    let gust: Double?
}
