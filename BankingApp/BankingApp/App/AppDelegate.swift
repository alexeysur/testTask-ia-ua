//
//  AppDelegate.swift
//  BankingApp
//
//  Created by Alexey on 18.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController: UIViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        self.viewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: viewController!)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = UIColor(named: "darkGray")
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                                                  .font: UIFont(name: "HelveticaNeue-Bold", size: 24)!
        ]
     
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
 
}

