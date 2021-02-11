//
//  SignUpViewModel.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 4/2/21.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    // MARK: Properties
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""

    // Use cases
    var authUseCase: FetchAuthUseCaseable
    var storeSession: StoreAuthUseCaseable

    // MARK: Constructor
    init(authUseCase: FetchAuthUseCaseable, storeSession: StoreAuthUseCaseable) {
        self.authUseCase = authUseCase
        self.storeSession = storeSession
    }
}

// MARK: Functionality
extension SignUpViewModel {
    func storeSession(credentials: AuthCredentials, stored: @escaping () -> Void) {
        storeSession.store(credentials: credentials) { result in
            switch result {
            case .success:
                stored()
            case .failure(let error):
                NSLog(error.localizedDescription)
            }
        }
    }
}

// MARK: Events
extension SignUpViewModel {
    func signUpTapped(onCompletion: @escaping (Scenes) -> Void) {
        authUseCase.execute { result in
            switch result {
            case .success(let credentials):
                self.storeSession(credentials: credentials) {
                    onCompletion(.base)
                }
            case .failure(let error):
                NSLog(error.localizedDescription)
                onCompletion(.login)
            }
        }
    }
}
