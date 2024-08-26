//
//  SettingsViewModel.swift
//  TestApp
//
//  Created by Vladislav Simonov on 25.08.24.
//

import UIKit

final class SettingsViewModel: SettingsViewModeling {
    
    var dataSource: Dynamic<[String]> = Dynamic(["About The App"])
    
    var showAlert: ((UIAlertController) -> Void)?
    
    func createAlert() {
        let alertController = UIAlertController(title: "Add Info About You",
                                                message: "",
                                                preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default,
                                       handler: { _ in
            let firstTextFieldText = (alertController.textFields?.first ?? UITextField()).text
            let secondTextFieldText = (alertController.textFields?.last ?? UITextField()).text
            
            self.dataSource.value.append("\(firstTextFieldText ?? "") \(secondTextFieldText ?? "")")
        })
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default,
                                         handler: { _ in })
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter First Name"
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter Second Name"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        showAlert?(alertController)
    }
}
