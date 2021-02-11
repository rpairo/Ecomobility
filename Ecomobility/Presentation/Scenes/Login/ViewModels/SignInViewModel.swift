//
//  SignInViewModel.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 4/2/21.
//

import Foundation

final class SignInViewModel: ObservableObject {
    // MARK: Properties
    @Published var email = ""
    @Published var password = ""

    // Use cases
    var authUseCase: FetchAuthUseCaseable
    var storeSessionUseCase: StoreAuthUseCaseable

    // MARK: Constructor
    init(authUseCase: FetchAuthUseCaseable, storeSession: StoreAuthUseCaseable) {
        self.authUseCase = authUseCase
        self.storeSessionUseCase = storeSession
    }

    // MARK: Events
    func authenticate(onCompletion: @escaping (Scenes) -> Void) {
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

    // MARK: Functionality
    func storeSession(credentials: AuthCredentials, onCompletion: @escaping () -> Void) {
        storeSessionUseCase.store(credentials: credentials) { result in
            switch result {
            case .success:
                onCompletion()
            case .failure(let error):
                NSLog(error.localizedDescription)
            }
        }
    }
}
