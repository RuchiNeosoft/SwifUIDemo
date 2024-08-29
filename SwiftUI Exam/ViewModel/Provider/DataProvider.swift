//
//  DataProvider.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import Foundation

protocol DataProvider {
	func getData() async -> Result<[EData], Error>
}
