//
//  AppDelegate.swift
//
//  Created by Shinren Pan on 2024/3/22.
//

import UIKit

@UIApplicationMain class AppDelegate: UIResponder {
    var window: UIWindow?
}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupAppearance()
        let bounds = UIScreen.main.bounds
        let window = UIWindow(frame: bounds)
        window.backgroundColor = .white
        window.rootViewController = makeRootViewController()
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }
}

// MARK: - Private

private extension AppDelegate {
    // MARK: Setup Something
    
    private func setupAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .white
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance.copy()
    }
    
    // MARK: - Make Something
    
    private func makeRootViewController() -> UIViewController {
        let result = CustomTabBarVC()
        result.viewControllers = [
            makeViewController(title: "Tab1", iconName: "calendar", color: .red),
            makeViewController(title: "Tab2", iconName: "bell", color: .gray),
            makeViewController(title: "Tab3", iconName: "paperplane", color: .green),
            makeViewController(title: "Tab4", iconName: "paperclip", color: .yellow),
            makeViewController(title: "Tab5", iconName: "person", color: .purple),
            makeViewController(title: "Tab6", iconName: "doc", color: .orange),
            // 基本上不要超過 6 個
            //makeViewController(title: "Tab7", iconName: "pencil", color: .brown),
            //makeViewController(title: "Tab8", iconName: "trash", color: .cyan),
            // iPhone 15 Pro 直式最多只能塞 8 個
            //makeViewController(title: "Tab9", iconName: "tray", color: .darkGray),
        ]
        
        return result
    }
    
    func makeViewController(title: String, iconName: String, color: UIColor) -> UIViewController {
        let result = UIViewController()
        result.view.backgroundColor = color
        result.tabBarItem = .init(title: title, image: .init(systemName: iconName), selectedImage: .init(systemName: iconName))
        
        return result
    }
}
