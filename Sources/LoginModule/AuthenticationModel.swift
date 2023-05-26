//
//  AuthenticationLogin.swift
//  LoginPage
//
//  Created by Martin Piccato on 26/05/2023.
//

import Foundation


public enum LoginStatus {
    case success
    case error
}
final public class AuthenticationModel: ObservableObject {
    @Published public var loginStatus: LoginStatus = .success
    @Published public var didUpdateLoginStatus: Bool = false
    
    public init() { }
    
    public func login(email:String, password: String) {
        if email.lowercased() == "mpiccato@me.com" {
            loginStatus = .success
            
            
        } else {
            loginStatus = .error
            
        }
        didUpdateLoginStatus = true
    }
    
    func signUp(email: String, password: String) {
        print("registrarse")
    }
    
    func recoverPassword(email: String) {
        print("Recuperar contraseña...")
    }
}
