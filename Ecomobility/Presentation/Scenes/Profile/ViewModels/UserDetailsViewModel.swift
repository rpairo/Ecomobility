//
//  UserDetailsViewModel.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

final class UserDetailsViewModel: ObservableObject {
    // MARK: Properties
    @Published var user = User()
    @Published var completionProgress: Float = 0

    // Use cases
    var fetchUserAuthUseCase: FetchUserAuthUseCaseable

    // MARK: Constructor
    init(fetchUserAuthUseCase: FetchUserAuthUseCaseable) {
        self.fetchUserAuthUseCase = fetchUserAuthUseCase
    }

    // MARK: Lifecycle
    func onAppear() {
        fetchUserAuth()
        updateCompletionProgress()
    }
}

// MARK: Functionality
extension UserDetailsViewModel {
    func fetchUserAuth() {
        fetchUserAuthUseCase.execute { result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.user = user
                }
            case .failure(let error):
                self.checkFetchUserError(error)
            }
        }
    }

    func checkFetchUserError(_ error: FetchUserError) {
        switch error {
        case .credentials:
            NSLog("Wrong credentials")
        case .unkown(let error):
            NSLog(error.localizedDescription)
        }
    }

    func updateCompletionProgress() {
        completionProgress = 70
    }
}

// MARK: Events
extension UserDetailsViewModel {
    func completeProfileTapped() {
        NSLog("Complete profile")
    }
}
