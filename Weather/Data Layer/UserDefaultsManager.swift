//
//  File.swift
//  Currency Convertion
//
//  Created by Akshita Patel on 09/22/23.
//

import Foundation

protocol UserDefaultsManager {
    func set<T>(_ value: T, forKey key: String)
    func get<T>(_ key: String) -> T?
    func remove(_ key: String)
}

class UserDefaultsManagerImpl: UserDefaultsManager {
    static let shared = UserDefaultsManagerImpl()
    
    private let userDefaults = UserDefaults.standard
    
    func set<T>(_ value: T, forKey key: String) {
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    func get<T>(_ key: String) -> T? {
        return userDefaults.value(forKey: key) as? T
    }
    
    func remove(_ key: String) {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
    }
}
