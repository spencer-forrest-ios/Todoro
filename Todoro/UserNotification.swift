//
//  UserNotificationOutput.swift
//  Todoro
//
//  Created by Spencer Forrest on 08/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol UserNotificationOutput {
  func setForPomodoro(_: Double)
  func setForRest(_: Double)
  func cancelAll()
  func checkPermission(_:@escaping (Bool)->())
}
