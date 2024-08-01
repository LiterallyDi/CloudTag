//
//  CheckboxListView.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import SwiftUI

struct CheckboxListView: View {
    @Binding var items: [CheckboxItem]
    @State var searchText = ""
    @State var isSingleSelect: Bool = false

    var body: some View {
        List(items.indices, id: \.self) { index in
            HStack {
                AnimatedCheckboxView(isChecked: $items[index].isChecked)

                Text(items[index].label)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(
                    .spring(response: 0.35,
                            dampingFraction: 0.65)
                ) {
                    if isSingleSelect {
                        for (i, ck) in items.enumerated() {
                            if ck.id != items[index].id {
                                items[i].isChecked = false
                            }
                        }
                    }
                    items[index].isChecked.toggle()
                }
            }
        }

        .background(Color.darkGray1)
    }
}
