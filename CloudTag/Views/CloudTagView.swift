//
//  CloudTagView.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import SwiftUI

struct CloudTagView: View {
    @Binding var tags: [CheckboxItem]
    @State private var rows: [[CheckboxItem]] = []
    let removeCloudAction: (_ cloud: CheckboxItem) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: 10) {
                    ForEach(self.rows[rowIndex], id: \.id) { item in
                        CloudTag(title: item) {
                            if let itemIndex = self.tags.firstIndex(of: item) {
                                self.tags.remove(at: itemIndex)
                                self.generateRows()
                                removeCloudAction(item)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.all, 10)
        .onAppear { generateRows() }
        .onChange(of: tags) { _ in
            generateRows()
        }
        .background(.thinMaterial)
        .frame(maxWidth: .infinity)
        .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
    }

    func generateRows() {
        rows = []
        var currentRow: [CheckboxItem] = []
        var currentRowWidth: CGFloat = 0

        for tag in tags {
            let tagWidth = tag.label.width(
                usingFont: UIFont.systemFont(ofSize: 16)) + 50

            /// Если тег не умещается на экране по своей длине
            if tagWidth > UIScreen.main.bounds.width - 20 {
                if !currentRow.isEmpty {
                    rows.append(currentRow)
                    currentRow = []
                    currentRowWidth = 0
                }
                rows.append([tag])
                continue
            }

            if currentRowWidth + tagWidth > UIScreen.main.bounds.width - 20 {
                rows.append(currentRow)
                currentRow = [tag]
                currentRowWidth = tagWidth
            } else {
                currentRow.append(tag)
                currentRowWidth += tagWidth
            }
        }

        if !currentRow.isEmpty {
            rows.append(currentRow)
        }
    }
}
