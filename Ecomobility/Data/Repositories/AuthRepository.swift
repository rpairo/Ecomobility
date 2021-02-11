//
//  AuthRepository.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

struct AuthRepository: AuthRepositable {
    // MARK: Properties
    var fetchingDataSource: FetchAuthDataSourceable
    var logoutDataSource: LogoutAuthDataSourceable
    var storeDataSource: StoreAuthDataSourceable
    var checkDataSource: CheckAuthDataSourceable
    var fetchUserDataSource: FetchUserAuthDataSourceable

    // MARK: Constructor
    init(fetchingDataSource: FetchAuthDataSourceable,
         logoutDataSource: LogoutAuthDataSourceable,
         storeDataSource: StoreAuthDataSourceable,
         checkDataSource: CheckAuthDataSourceable,
         fetchUserDataSource: FetchUserAuthDataSourceable) {

        self.fetchingDataSource = fetchingDataSource
        self.logoutDataSource = logoutDataSource
        self.storeDataSource = storeDataSource
        self.checkDataSource = checkDataSource
        self.fetchUserDataSource = fetchUserDataSource
    }

    // MARK: Functionality
    func fetch(onCompletion: @escaping FetchAuthResult) {
        fetchingDataSource.fetch(onCompletion: onCompletion)
    }

    func logout(onCompletion: @escaping LogoutAuthResult) {
        logoutDataSource.logout(onCompletion: onCompletion)
    }

    func store(credentials: AuthCredentials, onCompletion: @escaping StoreAuthResult) {
        storeDataSource.store(credentials: credentials, onCompletion: onCompletion)
    }

    func check(onCompletion: @escaping CheckAuthResult) {
        checkDataSource.check(onCompletion: onCompletion)
    }

    func fetch(onCompletion: @escaping FetchUserAuthResult) {
        fetchUserDataSource.fetch(onCompletion: onCompletion)
    }
}
