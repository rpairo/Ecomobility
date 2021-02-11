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

    // MARK: Events
    func register(onCompletion: @escaping (Page) -> Void) {
        authUseCase.execute { result in
            switch result {
            case .success(let credentials):
                self.storeSession(credentials: credentials) {
                    onCompletion(.map)
                }
            case .failure(let error):
                NSLog(error.localizedDescription)
                onCompletion(.login)
            }
        }
    }

    // MARK: Functionality
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
