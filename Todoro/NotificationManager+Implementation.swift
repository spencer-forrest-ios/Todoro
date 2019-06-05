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
        && (settings.alertSetting == .enabled
          || settings.soundSetting == .enabled)
      
      handler(isAuthorized)
    }
  }
  
  func setForPomodoro(_ duration: Double, count: Int) {
    self.notificationCenter.getNotificationSettings {
      (settings) in
      
      if settings.authorizationStatus == .authorized {
        let content = UNMutableNotificationContent()
        
        if settings.soundSetting == .enabled {
          content.sound = UNNotificationSound.default
        }
        
        if settings.alertSetting == .enabled {
          content.title = "Pomodoro \(count) over"
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: duration, repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content,
                                            trigger: trigger)
        // Schedule the request with the system.
        self.notificationCenter.add(request) {
          (error) in
          if let error = error {
            print(error.localizedDescription)
          }
        }
      }
      
    }
  }
  
  func setForRest(_ duration: Double, count: Int) {
    self.notificationCenter.getNotificationSettings {
      (settings) in
      
      if settings.authorizationStatus == .authorized {
        let content = UNMutableNotificationContent()
        
        if settings.soundSetting == .enabled {
          content.sound = UNNotificationSound.default
        }
        
        if settings.alertSetting == .enabled {
          content.title = "Rest \(count) over"
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: duration, repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content,
                                            trigger: trigger)
        // Schedule the request with the system.
        self.notificationCenter.add(request) {
          (error) in
          if let error = error {
            print(error.localizedDescription)
          }
        }
      }
      
    }
  }
  
  func cancelAll() {
    notificationCenter.removeAllPendingNotificationRequests()
    notificationCenter.removeAllDeliveredNotifications()
  }
}

