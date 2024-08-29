//
//  SceneDelegate.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import UIKit
import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = scene as? UIWindowScene else {
			return
		}

		let proxy = UIPageControl.appearance()
		proxy.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(0.6)
		proxy.currentPageIndicatorTintColor = UIColor.darkGray

		let window = UIWindow(windowScene: windowScene)

		let contentView = ContentView(viewModel: ViewModel(withDataProvider: DataDummyProvider()))
		window.rootViewController = UIHostingController(rootView: contentView)
		window.makeKeyAndVisible()

		self.window = window
	}
}
