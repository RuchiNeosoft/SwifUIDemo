//
//  BottomSheetView.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import Foundation
import SwiftUI

struct BottomSheetView: View {
    let data: [EDataChild]
    
    var itemCount: Int {
        return data.count
    }
    
    var characterCount: [(Character, Int)] {
        //join name from array
        let allNames = data.map { $0.name }.joined().replacingOccurrences(of: " ", with: "")
        let counts = allNames.reduce(into: [:]) { counts, char in
            counts[char, default: 0] += 1
        }
        return counts.sorted { $0.value > $1.value }.prefix(3).map { $0 }
    }
    
    var body: some View {
        VStack {
            Text("Statistics")
                .font(.title)
                .padding()
            
            Text("Total items: \(itemCount)")
                .padding(.bottom)
            
            ForEach(characterCount, id: \.0) { (char, count) in
                Text("\(String(char)) = \(count)")
            }
        }
        .padding()
    }
}
