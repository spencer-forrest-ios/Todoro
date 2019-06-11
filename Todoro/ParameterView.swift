//
//  ParameterView.swift
//  Todoro
//
//  Created by Spencer Forrest on 22/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit

class ParameterView: UIView {
  
  let pomodoroTextField: UITextField = {
    let textField = UITextField()
    textField.keyboardType = .numberPad
    textField.keyboardAppearance = .dark
    textField.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 220/255)
    textField.layer.cornerRadius = 3
    textField.clipsToBounds = true
    return textField
  }()
  
  let shortRestTextField: UITextField = {
    let textField = UITextField()
    textField.keyboardType = .numberPad
    textField.keyboardAppearance = .dark
    textField.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 220/255)
    textField.layer.cornerRadius = 3
    textField.clipsToBounds = true
    return textField
  }()
  
  let longRestTextField: UITextField = {
    let textField = UITextField()
    textField.keyboardType = .numberPad
    textField.keyboardAppearance = .dark
    textField.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 220/255)
    textField.layer.cornerRadius = 3
    textField.clipsToBounds = true
    return textField
  }()
  
  let pomodoroLabel: UILabel = {
    let label = UILabel()
    label.text = "Pomodoro duration in minutes:"
    label.textColor = UIColor.black
    return label
  }()
  
  let longRestLabel: UILabel = {
    let label = UILabel()
    label.text = "Long rest duration in minutes:"
    label.textColor = UIColor.black
    return label
  }()
  
  let shortRestLabel: UILabel = {
    let label = UILabel()
    label.text = "Short rest duration in minutes:"
    label.textColor = UIColor.black
    return label
  }()
  
  let maxPomodoriLabel: UILabel = {
    let label = UILabel()
    label.text = "Maximum number of pomodori:"
    label.textColor = UIColor.black
    return label
  }()
  
  
  let pomodoroStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = UIStackView.Alignment.center
    stackView.distribution = UIStackView.Distribution.fill
    stackView.spacing = 8
    return stackView
  }()
  
  let shortRestStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = UIStackView.Alignment.center
    stackView.distribution = UIStackView.Distribution.fill
    stackView.spacing = 8
    return stackView
  }()

  let longRestStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = UIStackView.Alignment.center
    stackView.distribution = UIStackView.Distribution.fill
    stackView.spacing = 8
    return stackView
  }()
  
  let maxPomodoriStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = UIStackView.Alignment.center
    stackView.distribution = UIStackView.Distribution.fill
    stackView.spacing = 8
    return stackView
  }()

  
  let mainStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = UIStackView.Alignment.fill
    stackView.distribution = UIStackView.Distribution.fillEqually
    return stackView
  }()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  init() {
    super.init(frame: .zero)
    
    pomodoroStackView.addArrangedSubview(self.pomodoroLabel)
    pomodoroStackView.addArrangedSubview(self.pomodoroTextField)
    
    shortRestStackView.addArrangedSubview(self.shortRestLabel)
    shortRestStackView.addArrangedSubview(self.shortRestTextField)
    
    longRestStackView.addArrangedSubview(self.longRestLabel)
    longRestStackView.addArrangedSubview(self.longRestTextField)
    
    maxPomodoriStackView.addArrangedSubview(self.maxPomodoriLabel)
    
    mainStackView.addArrangedSubview(self.pomodoroStackView)
    mainStackView.addArrangedSubview(self.shortRestStackView)
    mainStackView.addArrangedSubview(self.longRestStackView)
    mainStackView.addArrangedSubview(self.maxPomodoriStackView)
    addSubview(mainStackView)
    
    let constraints = [
      pomodoroTextField.widthAnchor.constraint(equalToConstant: 33),
      shortRestTextField.widthAnchor.constraint(equalToConstant: 33),
      longRestTextField.widthAnchor.constraint(equalToConstant: 33),
      
      mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
      mainStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
      mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
      mainStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4)
    ]
    
    NSLayoutConstraint.setAndActivate(constraints)
  }
}
