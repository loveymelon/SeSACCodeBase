//
//  TextField+Extension.swift
//  SeSACCodeBase
//
//  Created by 김진수 on 1/28/24.
//

import Foundation
import UIKit

extension UITextField {
    func setPlaceholder(string: String, color: UIColor) {
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}
