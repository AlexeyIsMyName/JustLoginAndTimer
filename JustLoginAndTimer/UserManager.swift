//
//  UserManager.swift
//  JustLoginAndTimer
//
//  Created by ALEKSEY SUSLOV on 03.04.2021.
//

import Combine

class UserManager: ObservableObject {    
    @Published var isRegistered: Bool
    var name: String
    
    init(_ couple: (isRegistered: Bool, name: String)) {
        self.isRegistered = couple.isRegistered
        self.name = couple.name
    }
    
    init(isRegistered: Bool, name: String) {
        self.isRegistered = isRegistered
        self.name = name
    }
}
