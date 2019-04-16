//
//  UserPreference.swift
//  Todoro
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol UserPreference {
  var isIdleTimerDisable: Bool { get set }
  
  var workDuration: Double { get set }
  var shortRestDuration: Double { get set }
  var longRestDuration: Double { get set }
}
