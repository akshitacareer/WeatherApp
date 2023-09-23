//
//  Sys.swift
//  Weather
//
//  Created by Akshita Patel on 09/22/23.
//

import Foundation

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}
