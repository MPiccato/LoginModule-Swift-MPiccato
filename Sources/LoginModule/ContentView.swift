//
//  ContentView.swift
//  LoginPage
//
//  Created by Martin Piccato on 26/05/2023.
//

import SwiftUI


public struct ContentView: View {
    
    @StateObject var authenticationViewModel = AuthenticationModel()
    
    @State var email: String = ""
    @State var password: String = ""
    
    public init() { }
    
    public var body: some View {
        VStack {
            Image("mpiccato-logo", bundle: .module)
                .resizable()
                .frame(width:200,height: 200)
            Group {
                HStack {
                    Image(systemName: "envelope.fill")
                    TextField("EMail", text: $email)
                        .keyboardType(.emailAddress)
                    
                }
                HStack {
                    Image(systemName: "key.fill")
                    TextField("Password", text: $password)
                        .keyboardType(.emailAddress)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.black, lineWidth: 1))
            .padding(.horizontal,80)
            
            Button("Ingresar") {
                authenticationViewModel.login(email: email, password: password)
            }
            .buttonStyle(.bordered)
            .tint(.black)
            Text("Suscribete a MP Data - Trading")
                .font(.footnote)
                .underline()
                .foregroundStyle(.tertiary)
                .padding(.top,40)
            Spacer()
        }
        .alert(authenticationViewModel.loginStatus == .success ? "Login Success" : "Login Error", isPresented: $authenticationViewModel.didUpdateLoginStatus) {
            Button("Aceptar") {
                print("Dissmiss Alert")
            }
        }
            
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
