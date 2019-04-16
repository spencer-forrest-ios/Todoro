//
//  UserPreferenceImplementation.swift
//  Todoro
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

class UserPreferenceFactoryImplementation: UserPreferenceFactory {
  func make() -> UserPreference {
    return UserPreferenceImplementation()
  }
}

class UserPreferenceImplementation: UserPreference {
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
  
  var workDuration: Double {
    get {
      let key = Constant.Key.workDurations
      let defaultValue = Constant.defaultValue.workDurations
      return getDuration(key, defaultValue)
    }
    
    set {
      let key = Constant.Key.workDurations
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
  
  private func setDuration(_ key: String, _ value: Double) {
    UserDefaults.standard.set(value, forKey: key)
  }
  
  private func getDuration(_ key: String, _ defaultValue: Double) -> Double {
    return UserDefaults.standard.value(forKey: key) as? Double ?? defaultValue
  }
}
