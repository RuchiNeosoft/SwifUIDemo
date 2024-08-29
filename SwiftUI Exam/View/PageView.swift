//
//  PageView.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import SwiftUI

struct PageView<Page: View>: View {
	var pages: [Page]
	@Binding var currentPage: Int

    var body: some View {
		VStack(spacing: 8) {
			PageViewController(pages: pages, currentPage: $currentPage)
				.aspectRatio(16/9.0, contentMode: .fit)
			/*PageControll(numberOfPages: pages.count, currentPage: $currentPage)
				.frame(maxWidth: 150)*/
		}
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
		PageView(pages: [ImageView(imageName: "wonders"), ImageView(imageName: "waterfalls")], currentPage: .constant(0))
    }
}
