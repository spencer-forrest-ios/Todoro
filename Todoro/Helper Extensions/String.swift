//
//  String.swift
//  Todoro
//
//  Created by Spencer Forrest on 22/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

extension String {
  
  var isDigit: Bool {
    let characters = NSCharacterSet.decimalDigits.inverted
    let isDigit = !self.isEmpty && self.rangeOfCharacter(from: characters) == nil
    return isDigit
  }
}
