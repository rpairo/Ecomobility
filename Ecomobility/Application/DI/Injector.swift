//
//  Injector.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 7/2/21.
//

import Foundation

struct Injector {
    // MARK: Properties
    let router = ViewRouter()
    static let shared = Injector()

    // MARK: Constructor
    private init() { }

    // MARK: Router
    func resolve() -> ViewRouter {
        router
    }

    // MARK: Views
    func resolve() -> LoginView {
        LoginView(viewModel: resolve())
    }

    func resolve() -> SignInView {
        SignInView(viewModel: resolve())
    }

    func resolve() -> LoginViewModel {
        LoginViewModel()
    }

    func resolve() -> SignUpView {
        SignUpView(viewModel: resolve())
    }

    // MARK: ViewModels
    func resolve() -> SignInViewModel {
        SignInViewModel(
            authUseCase: resolve(),
            storeSession: resolve()
        )
    }

    func resolve() -> SignUpViewModel {
        SignUpViewModel(
            authUseCase: resolve(),
            storeSession: resolve()
        )
    }

    func resolve() -> MapViewModel {
        MapViewModel()
    }

    func resolve() -> ProfileViewModel {
        ProfileViewModel(
            logoutAuthUseCase: resolve(),
            fetchUserAuthUseCase: resolve()
        )
    }

    func resolve() -> BaseViewModel {
        BaseViewModel(authUseCase: resolve())
    }

    func resolve() -> UserDetailsViewModel {
        UserDetailsViewModel(fetchUserAuthUseCase: resolve())
    }

    // MARK: Use cases
    func resolve() -> FetchAuthUseCaseable {
        FetchAuthUseCase(authRepository: resolve())
    }

    func resolve() -> LogoutAuthUseCaseable {
        LogoutAuthUseCase(authRepository: resolve())
    }

    func resolve() -> StoreAuthUseCaseable {
        StoreAuthUseCase(authRepository: resolve())
    }

    func resolve() -> CheckAuthUseCaseable {
        CheckAuthUseCase(authRepository: resolve())
    }

    func resolve() -> FetchUserAuthUseCaseable {
        FetchUserAuthUseCase(authRepository: resolve())
    }

    // MARK: Repositories
    func resolve() -> AuthRepositable {
        AuthRepository(
            fetchingDataSource: resolve(),
            logoutDataSource: resolve(),
            storeDataSource: resolve(),
            checkDataSource: resolve(),
            fetchUserDataSource: resolve()
        )
    }

    // MARK: Data sources
    func resolve() -> FetchAuthDataSourceable {
        Auth0DataSource()
    }

    func resolve() -> LogoutAuthDataSourceable {
        Auth0DataSource()
    }

    func resolve() -> StoreAuthDataSourceable {
        Auth0DataSource()
    }

    func resolve() -> CheckAuthDataSourceable {
        Auth0DataSource()
    }

    func resolve() -> FetchUserAuthDataSourceable {
        Auth0DataSource()
    }
}
