//
//  ListRowView.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import SwiftUI

struct ListRowView: View {
	let data: EDataChild
	var body: some View {
		HStack {
			Image(data.image)
				.resizable()
				.aspectRatio(1, contentMode: .fill)
				.frame(width: 50, height: 50)
				.cornerRadius(6)
			VStack(alignment: .leading, spacing: 8) {
				Text(data.name)
					.font(.body)
					.foregroundColor(Color(uiColor: .label))
				Text(data.detail)
					.font(.subheadline)
					.foregroundColor(Color(uiColor: .secondaryLabel))
			}
		}
	}
}

struct ListRowView_Previews: PreviewProvider {
	static var previews: some View {
		ListRowView(data: .preview)
	}
}
