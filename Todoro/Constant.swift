//
//  Constant.swift
//  Todoro
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

struct Constant {
  struct Key {
    static let longRestDuration = "longRestDuration"
    static let shortRestDuration = "longRestDuration"
    static let workDurations = "workDuration"
    static let isIdleTimerDisabled = "idleTimerEnabled"
  }
  
  struct defaultValue {
    static let longRestDuration: Double = 30 * 60
    static let shortRestDuration: Double = 5 * 60
    static let workDurations: Double = 25 * 60
    static let isIdleTimerDisabled = true
  }
}
