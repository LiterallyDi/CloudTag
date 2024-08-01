//
//  View+Extension.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}
