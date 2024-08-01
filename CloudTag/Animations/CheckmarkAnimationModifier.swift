//
//  CheckmarkAnimationModifier.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import SwiftUI

struct CheckmarkAnimationModifier: AnimatableModifier {
    var progress: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                CheckmarkShape(progress: progress)
                    .stroke(style: StrokeStyle(
                        lineWidth: 2,
                        lineCap: .round,
                        lineJoin: .round
                    )
                    )
            )
    }
}
