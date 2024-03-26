//
//  CustomTabBarVC.swift
//
//  Created by Shinren Pan on 2024/3/22.
//
//

import UIKit

final class CustomTabBarVC: UITabBarController {
    
    override var traitCollection: UITraitCollection {
        let realTraits = super.traitCollection
        // 使用假的 traitCollection 來讓 iPhone 可以塞超過 5 個
        let fakeTraits = UITraitCollection(horizontalSizeClass: .regular)
        
        return UITraitCollection(traitsFrom: [realTraits, fakeTraits])
    }
    
    // 下方三個 function 沒有 override 的話,
    // Present 一個整頁 UIViewController, dismiss 後會變成 5 個 Tab + More 模式
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        // 不做任何事
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        // 不做任何事
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // 不做任何事
    }
}
