//
//  AnimatedCheckboxView.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import SwiftUI

struct AnimatedCheckboxView: View {
    @Binding var isChecked: Bool
    @State private var progress: CGFloat = 0

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.buttonGray,
                              lineWidth: 2)
                .frame(width: 22, height: 22)
                .overlay(
                    Circle()
                        .fill(
                            isChecked ? Color.turquoise : Color.clear
                        )
                        .scaleEffect(isChecked ? 1 : 0)
                )

            CheckmarkShape(progress: progress)
                .stroke(style: StrokeStyle(
                    lineWidth: 2,
                    lineCap: .round,
                    lineJoin: .round
                ))
                .frame(width: 11, height: 11)
                .foregroundColor(.mediumGray)
        }
        .onAppear {
            self.progress = self.isChecked ? 1 : 0
        }
        .onChange(of: isChecked) { newValue in
            withAnimation(.easeInOut(duration: 0.3)) {
                self.progress = newValue ? 1 : 0
            }
        }
    }
}
