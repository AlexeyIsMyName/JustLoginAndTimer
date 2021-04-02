//
//  JustLoginAndTimerApp.swift
//  JustLoginAndTimer
//
//  Created by ALEKSEY SUSLOV on 02.04.2021.
//

import SwiftUI

@main
struct JustLoginAndTimerApp: App {
    @AppStorage("userName") var userName: String = ""
    @AppStorage("isRegistered") var isRegistered: Bool = false
    
//    @StateObject private var user = UserManager(isRegistered: isRegistered,
//                                                name: userName)
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(isRegistered: isRegistered, name: userName))
        }
    }
}
