//
//  Pomodoro.swift
//  Todoro
//
//  Created by Spencer Forrest on 16/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

class Pomodoro {
  private(set) var finishDate: Date?
  private(set) var startDate: Date?
  private(set) var timeLeft: TimeInterval?
  private var workDuration: TimeInterval
  private var restDuration: TimeInterval
  
  init(_ workDuration: TimeInterval = 0,
       restDuration: TimeInterval = 0) {
    self.workDuration = workDuration
    self.restDuration = restDuration
  }
  
  func setTime(_ duration: TimeInterval) {
    self.workDuration = duration
  }
  
  func setRest(_ duration: TimeInterval) {
    self.restDuration = duration
  }
  
  func rest() {
    countdownFromNow(self.restDuration)
  }
  
  func start() {
    countdownFromNow(self.workDuration)
  }
  
  func stop() {
    startDate = nil
    finishDate = nil
  }
  
  func pause() {
    if let finishDate = finishDate {
      let timeLeft = finishDate.timeIntervalSinceReferenceDate.rounded(.towardZero)
        - Date().timeIntervalSinceReferenceDate.rounded(.towardZero)
      self.timeLeft = timeLeft > 0 ? timeLeft : nil
      stop()
    }
  }
  
  func resume() {
    if let timeIntervalLeft = timeLeft {
      countdownFromNow(timeIntervalLeft)
    } else {
      stop()
    }
  }
  
  func reset() {
    stop()
    start()
  }
  
  private func countdownFromNow(_ duration: TimeInterval) {
    startDate = Date()
    let timeInterval = startDate!.timeIntervalSinceReferenceDate + duration
    finishDate = Date(timeIntervalSinceReferenceDate: timeInterval)
  }
}
