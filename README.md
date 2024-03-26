Title: UITabBarController 超過 5  個 Tab  
Categories: [iOS][L1]  
Labels: [UITabBarController][L2]  

## 前言  
<img src="/images/1.png" alt="image" width="375" height="auto">

一般來說, 官方的 UITabBarController 在 iOS 最多只會呈現 5 個 Tab,  
雖然已經跟 PM 及美術提過可能會違反 Apple 的  [Human Interface Guidelines], 
但是之前一部分上班的公司, 堅持想要超過 5 個 Tab.  
這裡用最簡單的方法來實現這個功能.

不過不建議這樣做,  
第一, 這不是官方提供的正確 api.  
第二, 根據 Apple 的 [Human Interface Guidelines], Apple 可能用會用這個條款 reject app.

> [!NOTE]  
> Use the minimum number of tabs required to help people navigate your app. Each additional tab increases the complexity of your app, making it harder for people to locate information. Aim for a few tabs with short titles or icons to avoid crowding and causing labels to truncate. In general, use up to **five tabs in iOS** and up to six in visionOS, iPadOS, and tvOS.

## 實作

實作一個繼承 UITabBarController 的客製化 ViewController, 並 override 以下 functions.  
重點在於 `override var traitCollection: UITraitCollection`, 就那麼簡單.  
但是 UITraitCollection(traitsFrom:) 已經在 iOS 17.0 deprecated,  
且在 Xcode console 會看到 `overrides the -traitCollection getter, which is not supported. If you're trying to override traits, you must use the appropriate API` 的警告訊息,  
所以最好不要使用這種方法, 最好自己實作一個類似 UITabBarController 的 Container,  
雖然還是有機率被 Apple 以違反  [Human Interface Guidelines] reject.


```swift
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
```

[L1]: https://github.com/shinrenpan/Note/discussions/categories/ios
[L2]: https://github.com/shinrenpan/Note/discussions?discussions_q=label:UITabBarController
[Human Interface Guidelines]: https://developer.apple.com/design/human-interface-guidelines/tab-bars