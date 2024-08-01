//
//  CheckmarkShape.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import SwiftUI

struct CheckmarkShape: Shape {
    var progress: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let start = CGPoint(x: rect.minX, y: rect.midY)
        let middle = CGPoint(x: rect.midX, y: rect.maxY)
        let end = CGPoint(x: rect.maxX, y: rect.minY)

        let middleProgress = progress > 0.5 ? 1.0 : (progress / 0.5)
        let endProgress = progress > 0.5 ? ((progress - 0.5) / 0.5) : 0.0

        let currentMiddle = CGPoint(
            x: start.x + (middle.x - start.x) * middleProgress,
            y: start.y + (middle.y - start.y) * middleProgress
        )

        let currentEnd = CGPoint(
            x: middle.x + (end.x - middle.x) * endProgress,
            y: middle.y + (end.y - middle.y) * endProgress
        )

        path.move(to: start)
        path.addLine(to: currentMiddle)
        if progress > 0.5 {
            path.addLine(to: currentEnd)
        }

        return path
    }

    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
}
