//
//  AppDelegate.swift
//  SwiftUI Exam
//
// Created by Apple on 29/08/24.
//

import UIKit

//@UIApplicationMain
final class AppDelegate: NSObject, UIApplicationDelegate {

	func application(
		_ application: UIApplication,
		configurationForConnecting connectingSceneSession: UISceneSession,
		options: UIScene.ConnectionOptions
	) -> UISceneConfiguration {
		let sceneConfiguration = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
		sceneConfiguration.delegateClass = SceneDelegate.self
		return sceneConfiguration
	}
}
