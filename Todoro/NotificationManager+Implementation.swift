//
//  NotificationManager+Implementation.swift
//  Todoro
//
//  Created by Spencer Forrest on 12/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UserNotifications

extension UserNotificationManager: UserNotification {
  
  func checkPermission(_ handler : @escaping (Bool) -> ()) {
    self.notificationCenter.getNotificationSettings {
      (settings) in
      
      let isAuthorized = settings.authorizationStatus == .authorized
        && settings.alertSetting == .enabled
        && settings.soundSetting == .enabled
      
      handler(isAuthorized)
    }
  }
  
  func setForPomodoro(_ duration: Double, count: Int) {
    let content = UNMutableNotificationContent()
    content.title = "Pomodoro \(count) over"
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: duration, repeats: false)
    
    let uuidString = UUID().uuidString
    
    let request = UNNotificationRequest(identifier: uuidString,
                                        content: content,
                                        trigger: trigger)
    
    // Schedule the request with the system.
    notificationCenter.add(request) {
      (error) in
      if let error = error {
        print(error.localizedDescription)
      }
    }
  }
  
  func setForRest(_ duration: Double, count: Int) {
    let content = UNMutableNotificationContent()
    content.title = "Rest \(count) over"
    content.body = "Rest \(count) just finished"
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: duration, repeats: false)
    
    let uuidString = UUID().uuidString
    
    let request = UNNotificationRequest(identifier: uuidString,
                                        content: content,
                                        trigger: trigger)
    
    // Schedule the request with the system.
    notificationCenter.add(request) {
      (error) in
      if let error = error {
        print(error.localizedDescription)
      }
    }
  }
  
  func cancelAll() {
    notificationCenter.removeAllPendingNotificationRequests()
    notificationCenter.removeAllDeliveredNotifications()
  }
}

