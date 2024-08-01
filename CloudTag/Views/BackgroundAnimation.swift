//
//  BackgroundAnimation.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import SwiftUI

struct BackgroundAnimation: View {
    @State private var offsetX1: CGFloat = -UIScreen.main.bounds.width
    @State private var offsetX2: CGFloat = -UIScreen.main.bounds.width * 1.5
    @State private var offsetX3: CGFloat = -UIScreen.main.bounds.width * 2

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            AnimationShape()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.3), Color.clear]), startPoint: .leading, endPoint: .trailing))
                .frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height)
                .offset(x: offsetX1)
                .animation(Animation.linear(duration: 12).repeatForever(autoreverses: true), value: offsetX1)
                .onAppear {
                    offsetX1 = UIScreen.main.bounds.width
                }

            AnimationShape()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.5), Color.clear]), startPoint: .leading, endPoint: .trailing))
                .frame(width: UIScreen.main.bounds.width * 2.5, height: UIScreen.main.bounds.height)
                .offset(x: offsetX2)
                .animation(Animation.linear(duration: 15).repeatForever(autoreverses: true), value: offsetX2)
                .onAppear {
                    offsetX2 = UIScreen.main.bounds.width
                }

            AnimationShape()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.8), Color.clear]), startPoint: .leading, endPoint: .trailing))
                .frame(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height)
                .offset(x: offsetX3)
                .animation(Animation.linear(duration: 18).repeatForever(autoreverses: true), value: offsetX3)
                .onAppear {
                    offsetX3 = UIScreen.main.bounds.width
                }
        }
    }
}
