//
//  UnauthorizedUserNotificationView.swift
//  Todoro
//
//  Created by Spencer Forrest on 08/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit

class UnauthorizedUserNotificationView: UIView {
  // TODO: change or add new labels
  
  let warningLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = NSTextAlignment.justified
    label.baselineAdjustment = .alignCenters
    label.textColor = UIColor.black
    return label
  }()
  
  let settingButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor.black
    button.setTitleColor(UIColor.white, for: .normal)
    button.setTitle("Go to Settings", for: .normal)
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    return button
  }()
  
  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = UIStackView.Distribution.fillProportionally
    return stackView
  }()

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  init() {
    super.init(frame: .zero)
    backgroundColor = UIColor.createFromRGB(200, 200, 200)
    stackView.addArrangedSubview(warningLabel)
    stackView.addArrangedSubview(settingButton)
    addSubview(stackView)
    setupConstraints()
  }
  
  func setupConstraints() {
    
    let constraints = [
      stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
      stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
      stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
      
      settingButton.heightAnchor.constraint(equalToConstant: 35)
    ]
    NSLayoutConstraint.setAndActivate(constraints)
  }

}
