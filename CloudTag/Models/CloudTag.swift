//
//  CloudTag.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import SwiftUI

struct CloudTag: View {
    let title: CheckboxItem
    var removeAction: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: 5) {
            Text(title.label)

            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.gray).onTapGesture {
                    removeAction?()
                }
        }

        .padding(.all, 8)
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}
