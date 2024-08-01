//
//  SelectableField.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import Foundation
import SwiftUI

struct SelectableField: View {
    let title: String
    @Binding var selectedItems: [CheckboxItem]
    @Binding var items: [CheckboxItem]

    @State var isSingleSelect: Bool = false
    @State private var isSheetPresented: Bool = false

    @State var tags: [CheckboxItem] = []

    var body: some View {
        VStack(spacing: 0) {
            header
            if !selectedItems.isEmpty {
                CloudTagView(
                    tags: $tags,
                    removeCloudAction: handleTagRemove
                )
            }
        }

        .onAppear {
            updateTags()
        }
        .onChange(of: selectedItems) { _ in
            updateTags()
            updateItems()
        }
    }

    private var header: some View {
        HStack {
            Text(title)
                .padding(.leading)
            Spacer()
            Button(action: {
                isSheetPresented.toggle()
            }) {
                HStack {
                    Text(selectedItems.isEmpty ? "Все" : "Изменить")
                    Image(systemName: "chevron.right")
                }
            }
            .font(.callout)
            .foregroundColor(Color.bluePurple)
        }
        .padding()
        .background(.thinMaterial)
        .frame(maxWidth: .infinity)
        .sheet(isPresented: $isSheetPresented) {
            OptionsSelectorView(
                items: $items,
                title: title,
                isSingleSelect: isSingleSelect,
                action: {
                    selectedItems = items.filter { $0.isChecked }
                }
            )
        }
    }

    private func updateTags() {
        tags = selectedItems
    }

    private func updateItems() {
        for selectedItem in selectedItems {
            if let index = items.firstIndex(matching: selectedItem.id) {
                items[index].isChecked = true
            }
        }
    }

    private func handleTagRemove(_ cloud: CheckboxItem) {
        if let index = items.firstIndex(matching: cloud.id) {
            items[index].isChecked = false
            selectedItems = items.filter { $0.isChecked }
        }
    }
}
