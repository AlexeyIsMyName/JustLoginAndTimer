//
//  RegisterView.swift
//  JustLoginAndTimer
//
//  Created by ALEKSEY SUSLOV on 02.04.2021.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    @State private var buttonIsActive = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { value in checkTF(value) }
                Text("\(name.count)")
                    .foregroundColor(buttonIsActive ? .green : .red)
            }.padding(.horizontal)
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }.disabled(!buttonIsActive)
        }
    }
    
    private func checkTF(_ value: String) {
        if value.count >= 3 {
            buttonIsActive = true
        } else {
            buttonIsActive = false
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegistered.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
