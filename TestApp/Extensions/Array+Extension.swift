//
//  Array+Extension.swift
//  TestApp
//
//  Created by Vladislav Simonov on 26.08.24.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
