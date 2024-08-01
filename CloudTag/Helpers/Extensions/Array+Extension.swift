//
//  Array+Extension.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching id: Element.ID) -> Int? {
        firstIndex { $0.id == id }
    }
}
