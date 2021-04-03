//
//  JustLoginAndTimerApp.swift
//  JustLoginAndTimer
//
//  Created by ALEKSEY SUSLOV on 02.04.2021.
//

import SwiftUI

@main
struct JustLoginAndTimerApp: App {
    @StateObject private var user = UserManager(StorageManager.shared.fetchUser())
    
    /* не получилось ((
    @AppStorage("userName") var userName: String = ""
    @AppStorage("isRegistered") var isRegistered: Bool = false
    */
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(user)
        }
    }
}
