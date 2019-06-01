//
//  NSLayoutConstraint.swift
//  Todoro
//
//  Created by Spencer Forrest on 26/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
  
  static func setAndActivate(_ constraints: [NSLayoutConstraint]) {
    for constraint in constraints {
      if let view = constraint.firstItem as? UIView {
        view.translatesAutoresizingMaskIntoConstraints = false
      }
      if let view = constraint.secondItem as? UIView {
        view.translatesAutoresizingMaskIntoConstraints = false
      }
    }
    NSLayoutConstraint.activate(constraints)
  }
  
}
