//
//  FlottingButton.swift
//  SwiftUI Exam
//
//  Created by Apple on 29/08/24.
//

import Foundation
import SwiftUI

struct FlottingButton: View {
    let data: [EDataChild]
    @State private var showBottomSheet = false
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showBottomSheet.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                .padding()
            }
        }
        .sheet(isPresented: $showBottomSheet) {
            BottomSheetView(data: data)
        }
    }
}

struct FlottingButton_Previews: PreviewProvider {
    static var previews: some View {
        FlottingButton(data: [.preview])
    }
}
