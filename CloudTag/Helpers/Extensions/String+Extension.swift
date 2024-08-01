//
//  String+Extension.swift
//  CloudTag
//
//  Created by Dianella on 01.08.24.
//

import Foundation
import UIKit

typealias widthOfFont = String

extension widthOfFont {
    func width(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
