//
//  Base.swift
//  Weather
//
//  Created by Akshita Patel on 09/22/23.
//

import Foundation

// MARK: - Base
struct Base: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}
