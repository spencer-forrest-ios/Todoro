//
//  PomodoroParameter+Implementation.swift
//  Todoro
//
//  Created by Spencer Forrest on 23/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

extension PomodoroParameter: Parameter {
  
  func setDefaultValue(pomodoroDuration: Double,
                        shortRestDuration: Double,
                        longRestDuration: Double,
                        maxPomodori: Int) {
    
    DefaultValue.pomodoroDuration = pomodoroDuration
    DefaultValue.shortRestDuration = shortRestDuration
    DefaultValue.longRestDuration = longRestDuration
    DefaultValue.maxPomodori = maxPomodori
  }
  
  func save(_ timeKeeper: TimeKeeper) {
    UserDefaults.standard.set(timeKeeper.finish, forKey: Key.finishTimeInterval)
    UserDefaults.standard.set(timeKeeper.isRunning, forKey: Key.isRunning)
    UserDefaults.standard.set(timeKeeper.count, forKey: Key.timerCount)
    UserDefaults.standard.set(timeKeeper.type.rawValue, forKey: Key.timerType)
  }
  
  func loadTimer() -> TimeKeeper {
    let finish = UserDefaults.standard.value(forKey: Key.finishTimeInterval) as? Double
    let isRunning = UserDefaults.standard.value(forKey: Key.isRunning) as? Bool ?? DefaultValue.isRunning
    let count = UserDefaults.standard.value(forKey: Key.timerCount) as? Int ?? DefaultValue.timerCount
    let type = UserDefaults.standard.value(forKey: Key.timerType) as? String ?? DefaultValue.timerType
    
    return TimeKeeper(finish: finish,
                 isRunning: isRunning,
                 count: count,
                 type: type)
  }
  
  var maxPomodori: Int {
    get {
      let key = Key.maxPomodori
      let defaultValue = DefaultValue.maxPomodori!
      return UserDefaults.standard.value(forKey: key) as? Int ?? defaultValue
    }
    
    set {
      let key = Key.maxPomodori
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
  
  var pomodoroDuration: Double {
    get {
      let key = Key.pomodoroDuration
      let defaultValue = DefaultValue.pomodoroDuration!
      return getDuration(key, defaultValue)
    }
    
    set {
      let key = Key.pomodoroDuration
      setDuration(key, newValue)
    }
  }
  
  var shortRestDuration: Double {
    get {
      let key = Key.shortRestDuration
      let defaultValue = DefaultValue.shortRestDuration!
      return getDuration(key, defaultValue)
    }
    
    set {
      let key = Key.shortRestDuration
      setDuration(key, newValue)
    }
  }
  
  var longRestDuration: Double {
    get {
      let key = Key.longRestDuration
      let defaultValue = DefaultValue.longRestDuration!
      return getDuration(key, defaultValue)
    }
    
    set {
      let key = Key.longRestDuration
      setDuration(key, newValue)
    }
  }
  
  var isNotificationsOptional: Bool {
    get {
      let key = Key.isNotificationsOptional
      let defaultValue = DefaultValue.isNotificationsOptional
      return UserDefaults.standard.value(forKey: key) as? Bool ?? defaultValue
    }
    
    set {
      let key = Key.isNotificationsOptional
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}
