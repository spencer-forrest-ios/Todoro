//
//  PomodoroParameter+Implementation.swift
//  Todoro
//
//  Created by Spencer Forrest on 23/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

extension PomodoroUserParameters: UserPreference {
  
  var isIdleTimerDisable: Bool {
    get {
      let key = Constant.Key.isIdleTimerDisabled
      let defaultValue = Constant.defaultValue.isIdleTimerDisabled
      let isDisabled = UserDefaults.standard.value(forKey: key) as? Bool
      return isDisabled ?? defaultValue
    }
    
    set {
      let key = Constant.Key.isIdleTimerDisabled
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
  
  var pomodoroDuration: Double {
    get {
      let key = Constant.Key.workDuration
      let defaultValue = Constant.defaultValue.pomodoroDuration
      return getDuration(key, defaultValue)
    }
    
    set {
      let key = Constant.Key.workDuration
      setDuration(key, newValue)
    }
  }
  
  var shortRestDuration: Double {
    get {
      let key = Constant.Key.shortRestDuration
      let defaultValue = Constant.defaultValue.shortRestDuration
      return getDuration(key, defaultValue)
    }
    
    set {
      let key = Constant.Key.shortRestDuration
      setDuration(key, newValue)
    }
  }
  
  var longRestDuration: Double {
    get {
      let key = Constant.Key.longRestDuration
      let defaultValue = Constant.defaultValue.longRestDuration
      return getDuration(key, defaultValue)
    }
    
    set {
      let key = Constant.Key.longRestDuration
      setDuration(key, newValue)
    }
  }
}
