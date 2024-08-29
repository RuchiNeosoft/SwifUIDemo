//
//  ViewModel.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import Foundation

class ViewModel: ObservableObject {
	private let provider: DataProvider
	@Published @MainActor private(set) var state: ViewState = .idle
	@Published @MainActor private(set) var data: [EData] = .init()

	init(withDataProvider dataProvider: DataProvider) {
		provider = dataProvider
	}

	@MainActor
	func getData() async {
		state  = .loading
		do {
			data = try await provider.getData().get()
			state = .loaded
		} catch {
			state = .errored(error)
		}
	}
}
