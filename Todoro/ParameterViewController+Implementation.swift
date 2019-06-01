//
//  ParameterViewController+Implementation.swift
//  Todoro
//
//  Created by Spencer Forrest on 25/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit

extension ParameterViewController: ParameterUserInterface {
  
  func set(_ parameter: ParameterViewModel) {
    
    paramaterView.pomodoroTextField.text = parameter.pomodoroText
    paramaterView.shortRestTextField.text = parameter.shortRestText
    paramaterView.longRestTextField.text = parameter.longRestText
    paramaterView.maxPomodoriTextField.text = parameter.maxPomodoriText
  }
  
  func alertParameterSaved(_ parameter: ParameterViewModel) {
    
    let alert = UIAlertController(title: parameter.title,
                                  message: parameter.message,
                                  preferredStyle: .alert)
    let okAction = UIAlertAction(title: parameter.confirmation, style: .default)
    alert.addAction(okAction)
    
    present(alert, animated: true)
  }
}

// MARK: TextField delegate
extension ParameterViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    
    let textCount = textField.text == nil ? 0 : textField.text!.count
    let count = textCount - range.length + string.count
    
    if string.isEmpty || count <= 3 && string.isDigit {
      return true
    }
    
    return false
  }
}
