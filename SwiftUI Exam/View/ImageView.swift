//
//  ImageView.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import SwiftUI

struct ImageView: View {
	let imageName: String
    var body: some View {
        Image(imageName)
			.resizable()
			.scaledToFill()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
		ImageView(imageName: "wonders")
    }
}
