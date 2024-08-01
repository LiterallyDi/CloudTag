//
//  CheckboxItem.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import Foundation

struct CheckboxItem: Equatable, Identifiable {
    var id: Int64 = 0
    var label: String = ""
    var isChecked: Bool = false
}
