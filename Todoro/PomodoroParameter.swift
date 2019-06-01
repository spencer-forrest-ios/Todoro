//
//  UserPreferenceImplementation.swift
//  Todoro
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

class PomodoroUserParameters {
  func setDuration(_ key: String, _ value: Double) {
    UserDefaults.standard.set(value, forKey: key)
  }
  
  func getDuration(_ key: String, _ defaultValue: Double) -> Double {
    return UserDefaults.standard.value(forKey: key) as? Double ?? defaultValue
  }
}
