//
//  UIController+Alert.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, okButton: @escaping () -> Void) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Fechar", style: .default) { _ in
                okButton()
            }
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
    }
}

