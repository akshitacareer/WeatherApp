//
//  Weather.swift
//  Weather
//
//  Created by Akshita Patel on 09/22/23.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let clouddescription, icon: String
    let main: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case clouddescription = "description"
        case icon
    }
}

