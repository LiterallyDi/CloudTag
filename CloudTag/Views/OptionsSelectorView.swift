//
//  OptionsSelectorView.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import Combine
import SwiftUI

struct OptionsSelectorView: View {
    @Binding var items: [CheckboxItem]
    @State var title: String
    @State var isSingleSelect: Bool = false

    @Environment(\.presentationMode) var presentation
    @State private var isApplyPressed: Bool = false
    @State private var isCancelPressed: Bool = false

    @State var searchText = ""
    @State var filteredItems: [CheckboxItem] = []

    let action: (() -> Void)?

    var body: some View {
        VStack {
            header
            checkboxListView
            Spacer()
            actionButtons
        }
        .background(Color.darkGray1.ignoresSafeArea())
        .onAppear {
            filteredItems = items
        }
    }

    private var header: some View {
        Text(title)
            .padding(.top)
            .font(.title2)
            .multilineTextAlignment(.center)
            .foregroundColor(Color.turquoise)
    }

    private var checkboxListView: some View {
        CheckboxListView(
            items: $filteredItems,
            isSingleSelect: isSingleSelect
        )
    }

    private var actionButtons: some View {
        HStack(spacing: 20) {
            cancelButton
            applyButton
        }
        .font(.callout)
        .padding(.horizontal)
        .padding(.bottom)
    }

    private var cancelButton: some View {
        Button(action: {
            self.presentation.wrappedValue.dismiss()
        }) {
            Text("Отмена")
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(Color.gray.cornerRadius(8))
                .foregroundColor(.black)
        }
    }

    private var applyButton: some View {
        Button(action: {
            for filteredItem in filteredItems {
                if let index = items.firstIndex(
                    where: { $0.id == filteredItem.id })
                {
                    items[index].isChecked = filteredItem.isChecked
                }
            }
            self.presentation.wrappedValue.dismiss()
            action?()
        }) {
            Text("Выбрать")
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(Color.turquoise.cornerRadius(8))
                .foregroundColor(.darkGray1)
        }
    }
}
