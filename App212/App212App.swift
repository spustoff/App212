//
//  App212App.swift
//  App212
//
//  Created by IGOR on 03/10/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_NdLXHtFEavSGqP3bMVJCiM42BRSKAp")
        Amplitude.instance().initializeApiKey("b97f0782fae65d90fc3855228321ab83")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App212App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
