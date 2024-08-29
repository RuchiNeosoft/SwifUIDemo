//
//  ViewState.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import Foundation

enum ViewState {
	case idle, loading, loaded, errored(Error)
}
