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
    @State private var isButtonActive = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { value in checkTF(value) }
                Text("\(name.count)")
                    .foregroundColor(isButtonActive ? .green : .red)
                Spacer()
            }.padding(.horizontal)
            
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }.disabled(!isButtonActive)
        }
    }
    
    private func checkTF(_ value: String) {
        if value.count >= 3 {
            isButtonActive = true
        } else {
            isButtonActive = false
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegistered.toggle()
            
            StorageManager.shared.saveUser(isRegistered: true,
                                           name: name)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
