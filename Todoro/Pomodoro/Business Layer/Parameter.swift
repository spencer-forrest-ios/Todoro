//
//  Parameter.swift
//  Todoro
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol Parameter {
  func setDefaultValue(pomodoroDuration: Double,
                        shortRestDuration: Double,
                        longRestDuration: Double)
  
  func save(_ : TimeKeeper)
  func loadTimer() -> TimeKeeper
  
  var pomodoroDuration: Double { get set }
  var shortRestDuration: Double { get set }
  var longRestDuration: Double { get set }
  var isNotificationsOptional: Bool { get set }
}
