//
//  PageViewController.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
	var pages: [Page]
	@Binding var currentPage: Int

	func makeCoordinator() -> Coordinator {
		Coordinator(parent: self)
	}

	func makeUIViewController(context: Context) -> UIPageViewController {
		let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
		pageVC.dataSource = context.coordinator
		pageVC.delegate = context.coordinator
		return pageVC
	}

	func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
		pageViewController.setViewControllers(
			[context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
	}

	class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

		var parent: PageViewController
		var controllers = [UIViewController]()

		init(parent: PageViewController) {
			self.parent = parent
			controllers = parent.pages.map { UIHostingController(rootView: $0) }
		}

		func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
			guard let index = controllers.firstIndex(of: viewController) else { return nil }
			let previousIndex = index - 1
			guard controllers.indices.contains(previousIndex) else { return nil }
			return controllers[previousIndex]
		}

		func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
			guard let index = controllers.firstIndex(of: viewController) else { return nil }
			let nextIndex = index + 1
			guard controllers.indices.contains(nextIndex) else { return nil }
			return controllers[nextIndex]
		}

		func presentationCount(for pageViewController: UIPageViewController) -> Int {
			controllers.count
		}

		func presentationIndex(for pageViewController: UIPageViewController) -> Int {
			guard let visibleVC = pageViewController.viewControllers?.first else { return 0 }
			return controllers.firstIndex(of: visibleVC) ?? 0
		}

		func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
			guard completed, let visibleVC = pageViewController.viewControllers?.first,
				  let index = controllers.firstIndex(of: visibleVC) else { return }
			parent.currentPage = index
		}
	}
}
