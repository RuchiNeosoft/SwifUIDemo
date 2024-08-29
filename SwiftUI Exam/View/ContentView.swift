//
//  ContentView.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import SwiftUI

struct ContentView: ExamAsyncView {
	@ObservedObject var viewModel: ViewModel
	@State private var currentPage = 0
	@State private var searchText: String = ""
	private var filteredData: [EDataChild] {
		if searchText.isEmpty {
			return viewModel.data[currentPage].listItems
		} else {
			return viewModel.data[currentPage].listItems.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
		}
	}

	var state: ViewState {
		viewModel.state
	}

    var loadedView: some View {
        ZStack {
            ScrollView {
                LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                    Section {
                        PageView(pages: viewModel.data.map { ImageView(imageName: $0.mainImage) }, currentPage: $currentPage)
                    }
                    Section {
                        ForEach(filteredData) { dataChild in
                            ListRowView(data: dataChild)
                        }
                    } header: {
                        TextField("Search", text: $searchText)
                            .padding(.vertical)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                            .shadow(radius: 4)
                    }
                    
                }
                .padding()
                // Floating button
            }
            FlottingButton(data: viewModel.data[currentPage].listItems)
        }
	}

	func load() {
		Task {
			await viewModel.getData()
		}
	}


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(viewModel: ViewModel(withDataProvider: DataDummyProvider()))
    }
}


