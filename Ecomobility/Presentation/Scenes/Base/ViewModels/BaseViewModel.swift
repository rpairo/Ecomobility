//
//  BaseViewModel.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

final class BaseViewModel: ObservableObject {
    // MARK: Properties
    var authUseCase: CheckAuthUseCaseable

    // MARK: Constructor
    init(authUseCase: CheckAuthUseCaseable) {
        self.authUseCase = authUseCase
    }

    // MARK: Lifecycle
    func onAppear(onCompletion: @escaping (Scenes) -> Void) {
        authUseCase.check { result in
            switch result {
            case .success:
                onCompletion(.base)
            case .failure:
                onCompletion(.login)
            }
        }
    }
}
