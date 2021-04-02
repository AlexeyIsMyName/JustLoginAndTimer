//
//  TimerView.swift
//  JustLoginAndTimer
//
//  Created by ALEKSEY SUSLOV on 03.04.2021.
//

import SwiftUI

struct TimerView: View {    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)!")
                .font(.title)
                .offset(x: 0, y: 50)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 120)
            Spacer()
            ButtonView()
                .environmentObject(timer)
            Spacer()
            ButtonLogOut()
                .environmentObject(user)
        }.padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(UserManager(isRegistered: false, name: ""))
    }
}

struct ButtonView: View {
    @EnvironmentObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text("\(timer.buttonTitle)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ButtonLogOut: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Button(action: logOut) {
            Text("Log Out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
    
    private func logOut() {
        StorageManager.shared.deleteUser()
        user.isRegistered = false
        user.name = ""
    }
}
