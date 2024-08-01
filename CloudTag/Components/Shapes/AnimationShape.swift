//
//  AnimationShape.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import SwiftUI

struct AnimationShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(
            to: CGPoint(x: rect.minX, y: rect.midY))
        path.addCurve(
            to: CGPoint(x: rect.maxX, y: rect.midY),
            control1: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.minY),
            control2: CGPoint(x: rect.maxX - rect.width * 0.3, y: rect.maxY))
        return path
    }
}
