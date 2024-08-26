//
//  SettingsViewModeling.swift
//  TestApp
//
//  Created by Vladislav Simonov on 25.08.24.
//

import UIKit

protocol SettingsViewModeling: AnyObject {
    var dataSource: Dynamic<[String]> { get }
    var showAlert: ((UIAlertController) -> Void)? { get set }
    
    func createAlert()
}
