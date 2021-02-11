//
//  AppDelegate.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import UIKit
import Auth0

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        return Auth0.resumeAuth(url, options: options)
    }
}
