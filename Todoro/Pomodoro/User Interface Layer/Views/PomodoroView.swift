//
//  PomodoroView.swift
//  Todoro
//
//  Created by Spencer Forrest on 26/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit

class PomodoroView: UIView {
  
  let statusLabel: UILabel = {
    let label = UILabel()
    label.text = "Waiting to Start a new Cycle"
    label.font = UIFont.systemFont(ofSize: 30)
    label.adjustsFontSizeToFitWidth = true
    label.textAlignment = .center
    label.baselineAdjustment = .alignCenters
    label.textColor = UIColor.black
    return label
  }()
  
  let topButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor.eden
    button.layer.cornerRadius = 15
    button.clipsToBounds = true
    button.isHidden = true
    return button
  }()
  
  let middleButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor.elm
    button.setTitle("Start", for: .normal)
    button.setTitleColor(.black, for: .highlighted)
    button.layer.cornerRadius = 15
    button.clipsToBounds = true
    return button
  }()
  
  let bottomButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor.red
    button.setTitle("Stop", for: .normal)
    button.setTitleColor(.black, for: .highlighted)
    button.layer.cornerRadius = 15
    button.clipsToBounds = true
    return button
  }()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  init() {
    super.init(frame: .zero)
    let stackView = setStackView()
    addSubview(stackView)
    setupConstraints(stackView)
  }
  
  private func setStackView() -> UIStackView {
    var arrangedSubviews: [UIView] = [
      statusLabel,
    ]
    
    let labelStackView = UIStackView(arrangedSubviews: arrangedSubviews)
    labelStackView.axis = .vertical
    labelStackView.alignment = .fill
    labelStackView.distribution = .fillEqually
    labelStackView.spacing = 0
    
    arrangedSubviews = [
      labelStackView,
      topButton,
      middleButton,
      bottomButton
    ]
    
    let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fill
    stackView.spacing = 16
    
    return stackView
  }
  
  private func setupConstraints(_ view: UIView) {
    
    let viewConstraints = [
      view.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
      view.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
      view.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      view.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/3)
    ]
    
    NSLayoutConstraint.setAndActivate(viewConstraints)
  }
}
