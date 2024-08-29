//
//  ExamView.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import SwiftUI

protocol ExamAsyncView: View {
	associatedtype IdleView: View
	associatedtype LoadedView: View
	associatedtype LoadingView: View
	associatedtype ErrorView: View
	var state: ViewState { get }
	var loadingMessage: String? { get }

	@ViewBuilder @MainActor var idleView: Self.IdleView { get }
	@ViewBuilder @MainActor var loadingView: Self.LoadingView { get }
	@ViewBuilder @MainActor var loadedView: Self.LoadedView { get }
	func load()
	@ViewBuilder @MainActor func getErrorView(with errorString: String) -> ErrorView

}

extension ExamAsyncView {
	var idleView: some View {
		Color.clear.onAppear {
			load()
		}
	}

	var loadingMessage: String? {
		nil
	}

	var loadingView: some View {
		ELoadingView(loadingMessage: loadingMessage)
	}

	func getErrorView(with errorString: String) -> some View {
		EErrorView(message: errorString) {
			load()
		}
	}

	@MainActor
	var body: some View {
		Group {
			switch state {
			case .idle:
				idleView
			case .loading:
				loadingView
			case .errored(let error):
				getErrorView(with: error.localizedDescription)
			case .loaded:
				loadedView
			}
		}
	}
}

struct ELoadingView: View {
	var loadingMessage: String?

	var body: some View {
		VStack {
			ProgressView()
			if let loadingMessage {
				Text(loadingMessage)
					.font(.callout)
			}
		}
		.foregroundColor(.secondary)
		.padding(.horizontal)
		.frame(maxHeight: .infinity)
	}
}

struct EErrorView: View {
	var title: String?
	var message: String?
	var retryAction: (() -> Void)?

	var body: some View {
		VStack(spacing: 16) {
			if let title {
				Text(title)
					.font(.title)
			}
			if let message {
				Text(message)
					.font(.body)
			}
			if let retryAction {
				Button(action: retryAction) {
					Text("Retry")
						.fontWeight(.semibold)
						.foregroundStyle(.black)
						.padding()
						.frame(maxWidth: .infinity)
						.overlay {
							RoundedRectangle(cornerRadius: 6)
								.stroke(lineWidth: 1.0)
						}
				}
			}
		}
		.foregroundColor(Color(uiColor: .label))
		.padding(.horizontal)
		.frame(maxHeight: .infinity)
	}
}
