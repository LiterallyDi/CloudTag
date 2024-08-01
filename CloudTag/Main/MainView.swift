//
//  MainView.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import SwiftUI

struct MainView: View {
    /// mock
    @State private var citySelectedItems: [CheckboxItem] = []
    @State private var cityItems: [CheckboxItem] = [
        CheckboxItem(id: 1, label: "Ереван", isChecked: false),
        CheckboxItem(id: 2, label: "Токио", isChecked: false),
        CheckboxItem(id: 3, label: "Москва", isChecked: false),
        CheckboxItem(id: 4, label: "Дубай", isChecked: false),
        CheckboxItem(id: 5, label: "Бали", isChecked: false),
        CheckboxItem(id: 6, label: "Бомако", isChecked: false),
    ]

    @State private var nameSelectedItems: [CheckboxItem] = []
    @State private var nameItems: [CheckboxItem] = [
        CheckboxItem(id: 1, label: "Dianella", isChecked: false),
        CheckboxItem(id: 2, label: "Donatella", isChecked: false),
        CheckboxItem(id: 3, label: "Diana", isChecked: false),
        CheckboxItem(id: 4, label: "Daniella", isChecked: false),
        CheckboxItem(id: 5, label: "Danil", isChecked: false),
        CheckboxItem(id: 6, label: "Daniel", isChecked: false),
    ]

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            SelectableField(
                title: "Города",
                selectedItems: $citySelectedItems,
                items: $cityItems
            )

            Divider()
                .background(Color.greenCustom)
                .padding(.vertical, 5)

            SelectableField(
                title: "Имена",
                selectedItems: $nameSelectedItems,
                items: $nameItems
            )
            Spacer()
        }
        .background(
            BackgroundAnimation().ignoresSafeArea()
        )
    }
}
