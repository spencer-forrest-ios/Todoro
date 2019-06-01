//
//  UserNotification.swift
//  Todoro
//
//  Created by Spencer Forrest on 08/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol UserNotification {
  func setForPomodoro(_: Double, count: Int)
  func setForRest(_: Double, count: Int)
  
  func checkPermission(_:@escaping (Bool)->())
  func cancelAll()
}
