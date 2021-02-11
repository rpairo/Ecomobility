//
//  ProfileViewModel.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 8/2/21.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    // MARK: Properties
    @Published var user = User()
    @Published var amount = ""
    @Published var isPushNotificated = true
    @Published var isNewsNotificated = false

    var logoutAuthUseCase: LogoutAuthUseCaseable
    var fetchUserAuthUseCase: FetchUserAuthUseCaseable

    // MARK: Constructor
    init(logoutAuthUseCase: LogoutAuthUseCaseable,
         fetchUserAuthUseCase: FetchUserAuthUseCaseable) {

        self.logoutAuthUseCase = logoutAuthUseCase
        self.fetchUserAuthUseCase = fetchUserAuthUseCase
    }

    // MARK: Lifecycle
    func onAppear() {
        updateAmount(amount: 10.23)
        fetchUserAuth()
    }

    // MARK: Functionality
    func updateAmount(amount: NSNumber) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_GB")

        guard let currencyAmount = formatter.string(from: amount) else { return }
        self.amount = currencyAmount
    }

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

    // MARK: Events
    func logoutTapped(onCompletion: @escaping (Page) -> Void) {
        logoutAuthUseCase.execute { result in
            switch result {
            case .success:
                onCompletion(.login)
            case .failure:
                onCompletion(.map)
            }
        }
    }

    func settingsTapped() {
        NSLog("Settings tapped")
    }
}
