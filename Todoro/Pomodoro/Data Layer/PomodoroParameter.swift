//
//  PomodoroParameter.swift
//  Todoro
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

class PomodoroParameter {
  
  class Key {
    static let longRestDuration = "longRestDuration"
    static let shortRestDuration = "shortRestDuration"
    static let pomodoroDuration = "pomodoroDuration"
    static let isPomodoro = "isPomodoro"
    static let count = "count"
    static let timerType = "timerType"
    static let timerCount = "timerCount"
    static let isRunning = "isRunning"
    static let finishTimeInterval = "timeInterval"
    static let isNotificationsOptional = "isNotificationsOptional"
  }
  
  class DefaultValue {
    static var longRestDuration: Double!
    static var shortRestDuration: Double!
    static var pomodoroDuration: Double!
    static let timerType = "Pomodoro"
    static let timerCount = 0
    static let isRunning = false
    static let isNotificationsOptional = false
  }
  
  func setDuration(_ key: String, _ value: Double) {
    UserDefaults.standard.set(value, forKey: key)
  }
  
  func getDuration(_ key: String, _ defaultValue: Double) -> Double {
    return UserDefaults.standard.value(forKey: key) as? Double ?? defaultValue
  }
}
