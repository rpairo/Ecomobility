# Ecomobility

This application is a portfolio to meet the challenge of a selection process.

In my implementation I have used [SwiftUI](https://developer.apple.com/xcode/swiftui/) as a visual library. The reason is simple: it is the future of design in the Apple ecosystem. I have also decided to use the [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/) provided by the system, due to its integration with the idiosyncrasy of iOS.

I have also built on the concepts of [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) along with the [MVVM](https://en.wikipedia.org/wiki/Model–view–viewmodel) visual pattern. The reason for using this combination is in the maintainability, scalability and decoupling they provide.

As for the design, I have modified this one to comply with [Apple's Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/). I realized that the design presented in the requirements was done as a fast MVP, without taking into account the idiosyncrasies of the platform.

I have also been able to use MapKit instead of Google Maps or MapBox due to the efficiency and integration that the native solution provides.

I have also added Apple's SSO, this is due to 2 reasons: It is [mandatory](https://developer.apple.com/news/?id=03042020d) to implement Apple's own solution whenever the SSO of another company has been implemented, and because the privacy and benefit for the user that they provide seem appropriate to me.

This implementation offers a Login flow, maintaining the session. I have only implemented Google, Facebook, Apple, Microsoft and Twitter SSOs. Although I believe that the best implementation for production will be the native Apple solution, without intermediaries.

I have also opted for the use of Dependency Injection to decouple the responsibility of creating the instances and a ViewRouter to manage the navigation flow between scenes.

As the only external dependency I have decided to use the native library that Auth0 provides. I would have preferred to do a totally abstract implementation using HTTP, but given the time I had for testing I decided to use this solution. As a dependency manager I have used SPM, Apple's native solution, due to its cleanliness and integration.


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
|![Project](https://user-images.githubusercontent.com/14141324/107671953-ab4f6980-6c94-11eb-9282-cca5db0bfaab.png)|![Presentation](https://user-images.githubusercontent.com/14141324/107674084-e18de880-6c96-11eb-8bca-0bb28bbda87a.png)|![Domain](https://user-images.githubusercontent.com/14141324/107673889-adb2c300-6c96-11eb-848d-08c886838cd5.png)|![Data](https://user-images.githubusercontent.com/14141324/107675192-1ea6aa80-6c98-11eb-8e56-4ca902fb0f21.png)|![Application](https://user-images.githubusercontent.com/14141324/107674762-9a542780-6c97-11eb-81aa-b3f24069f8bb.png)|


### Presentation layer

