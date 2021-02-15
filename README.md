# Ecomobility

![Icon](https://user-images.githubusercontent.com/14141324/107708942-a73b4000-6cc4-11eb-8755-1f97a142c0a0.png)

This application is a portfolio to meet the challenge of a selection process.

In my implementation I have used [SwiftUI](https://developer.apple.com/xcode/swiftui/) as a visual library. The reason is simple: it is the future of design in the Apple ecosystem. I have also decided to use the [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/) provided by the system, due to its integration with the idiosyncrasy of iOS.

I have also built on the concepts of [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) along with the [MVVM](https://en.wikipedia.org/wiki/Model–view–viewmodel) visual pattern. The reason for using this combination is in the maintainability, scalability and decoupling they provide.

As for the design, I have modified this one to comply with [Apple's Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/). I realized that the design presented in the requirements was done as a fast MVP, without taking into account the idiosyncrasies of the platform.

I have also been able to use MapKit instead of Google Maps or MapBox due to the efficiency and integration that the native solution provides.

I have also added Apple's SSO, this is due to 2 reasons: It is [mandatory](https://developer.apple.com/news/?id=03042020d) to implement Apple's own solution whenever the SSO of another company has been implemented, and because the privacy and benefit for the user that they provide seem appropriate to me.

This implementation offers a Login flow, maintaining the session. I have only implemented Google, Facebook, Apple, Microsoft and Twitter SSOs. Although I believe that the best implementation for production will be the native Apple solution, without intermediaries.

I have also opted for the use of Dependency Injection to decouple the responsibility of creating the instances and a ViewRouter to manage the navigation flow between scenes.

As the only external dependency I have decided to use the native library that Auth0 provides. I would have preferred to do a totally abstract implementation using HTTP, but given the time I had for testing I decided to use this solution. As a dependency manager I have used SPM, Apple's native solution, due to its cleanliness and integration.

I have also implemented [SwiftLint](https://github.com/realm/SwiftLint) with [Ray Wenderlich's ](https://github.com/raywenderlich/swift-style-guide)setting as a linter. This is a tool to enforce Swift style and conventions.

## Scenes

I have grouped the views into different scenes, depending on the context of the flow of the set. Each View has a corresponding ViewModel, that is in charge of all the logical management of the view, freeing it from such responsibility, and I have undocked any reusable components.

### Login

|Login|Sign in|Sign up|Auth0|
|---|---|---|---|
|![Login](https://user-images.githubusercontent.com/14141324/107669447-06cc2800-6c92-11eb-8c10-a5a87f5bb674.PNG)|![SignIn](https://user-images.githubusercontent.com/14141324/107669396-fa47cf80-6c91-11eb-8674-1ebcc9878ae7.PNG)|![SignUp](https://user-images.githubusercontent.com/14141324/107669344-ebf9b380-6c91-11eb-8f6e-5f0351223e16.PNG)|![Auth0](https://user-images.githubusercontent.com/14141324/107669282-ddab9780-6c91-11eb-9cf4-8cbf924e0a19.PNG)|

### Map

|Map|Profile|Profile details|
|---|---|---|
|![Map](https://user-images.githubusercontent.com/14141324/107669234-d1273f00-6c91-11eb-9d9d-e981c94e7a67.PNG)|![Profile](https://user-images.githubusercontent.com/14141324/107669168-bf459c00-6c91-11eb-9215-977d8a52cea3.PNG)|![ProfileDetails](https://user-images.githubusercontent.com/14141324/107669074-a937db80-6c91-11eb-9881-df301a315bce.PNG)


## Architecture

For the development of the architecture I have used concepts from Clean Architecture and SOLID. Making use of these to improve the maintainability of the project and providing a robust base from which to scale. Separating the project into 3 main layers.

I have used dependency inversion to be able to provide versatility and decoupling to the code. In this way, through the injection of dependencies we obtain many facilities when testing and mocking the dependencies of the SUT. It also provides us with the versatility of being able to switch between logic modules that comply with the protocols and, in this way, have the possibility of exchanging certain behaviors without affecting the rest of the project. All this, complying with the principle of segregation.

|Project structure|Presentation structure|Domain structure|Data structure|Application structure|
|---|---|---|---|---|
|![Project](https://user-images.githubusercontent.com/14141324/107710247-e1a5dc80-6cc6-11eb-9666-31bbe0bf3c4c.png)|![Presentation](https://user-images.githubusercontent.com/14141324/107710320-0306c880-6cc7-11eb-80af-2fbca8c6a0cd.png)|![Domain](https://user-images.githubusercontent.com/14141324/107710363-14e86b80-6cc7-11eb-9727-8cdd3cb7cf2c.png)|![Data](https://user-images.githubusercontent.com/14141324/107952707-6419ef00-6f9a-11eb-99ec-1f37343cf2b2.png)|![Application](https://user-images.githubusercontent.com/14141324/107952580-3cc32200-6f9a-11eb-9273-9fa60cb1ab7d.png)|


### Presentation layer

In the presentation layer there are two main characters: the Views and the ViewModels.

Views are a declarative representation based on state, decoupled from logic, as this will be handled by the viewmodels.

We are going to analyze an example of View and ViewModel.

#### View

```swift
import SwiftUI

struct SignInView: View {
    // MARK: Properties
    @StateObject var viewModel: SignInViewModel
    @EnvironmentObject var viewRouter: ViewRouter

    // MARK: View
    var body: some View {
        VStack {
            Spacer()
            logoSection
            fieldsSection
            Spacer()
            loginButtonSection
            textSeparatorSection
            socialButtonsSection
        }
    }
}

// MARK: Sections
extension SignInView {
    // MARK: Views
    var fieldsSection: some View {
        VStack(alignment: .center, spacing: 15) {
            LoginTextField(placeholder: "Email", input: $viewModel.email)
                .textContentType(.emailAddress)
                .autocapitalization(.none)

            LoginSecureField(placeholder: "Password", input: $viewModel.password)
        }
        .padding(.top, 60)
    }

    var socialButtonsSection: some View {
        HStack(spacing: 15) {
            SocialAppleButton(
                onRequest: viewModel.appleOnRequestAuthentication,
                onResult: viewModel.appleOnResultAuthentication
            )

            SocialFacebookButton(
                onRequest: viewModel.facebookOnRequestAuthentication,
                onResult: viewModel.facebookOnResultAuthentication,
                title: "Sign in with Facebook"
            )

            SocialGoogleButton(
                onRequest: viewModel.facebookOnRequestAuthentication,
                onResult: viewModel.facebookOnResultAuthentication,
                title: "Sign in with Google"
            )
        }
        .padding(.bottom, 5)
    }

    // MARK: Components
    var logoSection: some View {
        Image("company_logo")
            .resizable()
            .scaledToFill()
            .frame(width: 350, height: 50)
            .padding()
    }

    var loginButtonSection: some View {
        LoginButton(title: "SIGN IN") {
            viewModel.signInTapped { scene in
                viewRouter.currentScene = scene
            }
        }
    }

    var textSeparatorSection: some View {
        Text("- OR -")
            .padding(3)
            .font(.caption)
            .foregroundColor(.accentColor)
    }
}
```

First of all, you can see the import of the ViewModel and the ViewRouter through their respective **PropertyWrappers** to provide the necessary logic in the performance of this view.

It should be emphasized that the view should not have any responsibility for any logic, and should only be limited to displaying the user interface.

We can observe a clear modularization of the views used in the composition of the main view, thus facilitating its maintainability and readability.

In case of finding repetitions of view, it must be encapsulated as an independent view for reuse, complying with the **DRY** principle.

All logic derived from user interactions or received events will be managed through the ViewModel, delegating the computation to it and receiving a possible result that changes the state of the view.

In this case there are many magic numbers and strings, derived from the time available for the development of this technical test. In a real production case, this data should be centralized and localized in the case of strings, out of sight.

#### ViewModel

```swift
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
}

// MARK: Functionality
extension SignInViewModel {
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

// MARK: Events
extension SignInViewModel {
    func signInTapped(onCompletion: @escaping (Scenes) -> Void) {
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
```
First of all, we can see the exposed properties using the PropertyWrapper **@Published** to feed them with the inputs from the view.

The ViewModels have declared the use cases that they will require to fulfill their functionality.

In this case, we have the **FetchAuthUseCaseable**, which is responsible for obtaining user authentication, and the **StoreAuthUseCaseable**, which is responsible for storing the session to be able to work with it later.

I communicate with the use cases through Closures and Result types. I have chosen this method for its elegance and clarity.

Through the use of extensions, we divide the functional contexts of the ViewModel to facilitate its maintainability.

It is important to keep the ViewModel decoupled from the view, avoiding any dependency and/or import of visual libraries. Communication between the viewmodel and the view will occur through the observables.

### Domain layer

The domain layer is totally foreign to the rest of the layers, and it is strictly forbidden to know anything outside of it. Nor should the platform import libraries, recommending only using the language API and nothing else. In this way, we can reuse this layer if we wanted to in any other project, regardless of the version of the operating system or the visual language used, on any platform that supports the language.

This layer is responsible for providing through the **Use Cases** what is requested. If necessary, they will need **repositories** to obtain the necessary data with which to fulfill their function.

Communication with the repositories will be done through a protocol, thus abstracting itself from the data layer.

#### UseCase protocol

```swift
import Foundation

typealias FetchUserAuthResult = (Result<User, FetchUserError>) -> Void

enum FetchUserError: Error {
    case credentials
    case unkown(Error)
}

protocol FetchUserAuthUseCaseable {
    // MARK: Functionality
    func execute(onCompletion: @escaping FetchUserAuthResult)
}
```

The use case protocol is the element that decouples the presentation layer from the domain. This will be in charge of communicating both layers. For convenience, I like to take advantage of the file of the declaration of this protocol to also declare the type of result that the use case is going to offer, and if necessary, a type of error of its own for it.

#### UseCase

```swift
import Foundation

struct FetchUserAuthUseCase: FetchUserAuthUseCaseable {
    // MARK: Properties
    var authRepository: AuthRepositable

    // MARK: Functionality
    func execute(onCompletion: @escaping FetchUserAuthResult) {
        authRepository.fetch(onCompletion: onCompletion)
    }
}
```

The use case is the element in charge of managing the logic necessary to construct the response that the presentation layer has requested. It can contain other use cases and repositories as dependencies to obtain the resources required for its function.

#### Repository protocol

```swift
import Foundation

protocol AuthRepositable {
    // MARK: Functionality
    func fetch(onCompletion: @escaping FetchAuthResult)
    func logout(onCompletion: @escaping LogoutAuthResult)
    func store(credentials: AuthCredentials, onCompletion: @escaping StoreAuthResult)
    func check(onCompletion: @escaping CheckAuthResult)
    func fetch(onCompletion: @escaping FetchUserAuthResult)
}
```

Repository protocols are the elements in charge of decoupling the obtaining of data from the domain. They are used to maintain an abstract communication between the use case and the repository.

The protocol must bring together the operations that belong to the same context.

#### Entity

```swift
import Foundation

struct User {
    // MARK: Properties
    var name: String?
    var email: String?
    var picture: String?
    var nickname: String?
    var familyName: String?
    var givenName: String?

    // Computed properties
    var pictureData: Data? {
        guard let picture = self.picture else { return nil }
        guard let url = URL(string: picture) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        return data
    }
}
```

The entity is nothing more than a flat model without logic, to transmit data between the different layers of the architecture. The domain layer is completely foreign to the presentation and data layers, so the latter will communicate with the domain using their own entities.

### Data layer

In the data layer we find two main actors: The Repositories and the DataSources.

The repository is foreign to the implementation of the data source, so the latter must communicate with the repository with entities known to it.

#### Repository

```swift
import Foundation

struct AuthRepository: AuthRepositable {
    // MARK: Properties
    var fetchingDataSource: FetchAuthDataSourceable
    var logoutDataSource: LogoutAuthDataSourceable
    var storeDataSource: StoreAuthDataSourceable
    var checkDataSource: CheckAuthDataSourceable
    var fetchUserDataSource: FetchUserAuthDataSourceable

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
```

The repositories are in charge of managing all the operations of the same context, and choosing a suitable data source for it. It could be the case of using different data sources for the same repository, that is why there is a data source corresponding to each operation.

#### DataSource protocol
```swift
import Foundation

protocol LogoutAuthDataSourceable {
    // MARK: Functionality
    func logout(onCompletion: @escaping LogoutAuthResult)
}
```

The data sources must implement the communication protocol with the repository, thus decoupling any dependencies between them.

#### DataSource

```swift
import Foundation
import Auth0

extension Auth0DataSource: FetchAuthDataSourceable {
    // MARK: Functionality
    func fetch(onCompletion: @escaping FetchAuthResult) {
        guard let domain = domain else { return }

        Auth0
            .webAuth()
            .scope("openid profile email offline_access")
            .audience("https://\(domain)/userinfo")
            .start { result in
                switch result {
                case .success(let credentials):
                    onCompletion(.success(credentials.transform()))
                case .failure(let error):
                    onCompletion(.failure(error))
                }
            }
    }
}
```

The data sources is the element in charge of obtaining the data. It can be both remote data (http for example) or local data (from third party libraries for example).

This layer is allowed to import external elements if necessary, since they will be encapsulated in it, and will not affect the rest of the architecture.

#### Entities extensions

```swift
import Foundation
import Auth0

extension Credentials {
    // MARK: Constructor
    convenience init(_ credentials: AuthCredentials) {
        self.init(
            accessToken: credentials.accessToken,
            tokenType: credentials.tokenType,
            idToken: credentials.idToken,
            refreshToken: credentials.refreshToken,
            expiresIn: credentials.expiresIn,
            scope: credentials.scope
        )
    }

    // MARK: Functionality
    func transform() -> AuthCredentials {
        AuthCredentials(
            accessToken: self.accessToken,
            expiresIn: self.expiresIn,
            idToken: self.idToken,
            refreshToken: self.refreshToken,
            scope: self.scope,
            tokenType: self.tokenType
        )
    }
}
```

For the sake of cleanliness and readability, I like to extend the external models and implement transformation responsibility between the domain entity (BO) and it (DTO).

To do this, I create a constructor that receives the BO and propagates its mapping to the constructor of the DTO. I also create a function that transforms the DTO into BO, mapping the local properties and calling the DTO's constructor with them.