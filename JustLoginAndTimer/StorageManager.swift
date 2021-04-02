//
//  StorageManager.swift
//  JustLoginAndTimer
//
//  Created by ALEKSEY SUSLOV on 03.04.2021.
//

import Foundation

class StorageManager {
    static var shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    
    func saveUser(isRegistered: Bool, name: String) {
        userDefaults.set(isRegistered, forKey: "isRegistered")
        userDefaults.set(name, forKey: "name")
    }
    
    func fetchUser() -> (isRegistered: Bool?, name: String?) {
        let isRegistered = userDefaults.bool(forKey: "isRegistered")
        let name = userDefaults.string(forKey: "name")
        
        return (isRegistered, name)
    }
    
    func deleteUser() {
        userDefaults.set(false, forKey: "isRegistered")
        userDefaults.set("", forKey: "name")
    }
}
