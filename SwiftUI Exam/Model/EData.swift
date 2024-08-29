//
//  EData.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import Foundation

struct EData {
	let mainImage: String
	let listItems: [EDataChild]
}

struct EDataChild: Identifiable {
	let id = UUID()
	let image: String
	let name: String
	let detail: String
}
