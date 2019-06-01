//
//  PomodoroUseCase.swift
//  Todoro
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

class PomodoroUseCase: NSObject {
  
  var outputBoundary: OutputBoundary
  var userPreference: UserPreference
  
  var pomodoroLeft = 1
  var pomodoroCount = 1
  
  var pomodoro: Pomodoro
  var workDuration: TimeInterval
  var shortRestDuration: TimeInterval
  var longRestDuration: TimeInterval
  
  var timer: Timer!
  
  override init() {
    userPreference = Factory.pomodoroUserPreference.make()
    outputBoundary = Factory.pomodoroOutputBoundary.make()
    
    workDuration = userPreference.workDuration
    longRestDuration = userPreference.longRestDuration
    shortRestDuration = userPreference.shortRestDuration
    
    pomodoro = Pomodoro(10, restDuration: shortRestDuration)
  }
  
  @objc func sendNewTimeInterval(_ timer: Timer) {
    guard let startDate = pomodoro.startDate,
      let finishDate = pomodoro.finishDate
      else {
        timer.invalidate()
        return
    }
    
    let finishTimeInterval = finishDate.timeIntervalSinceReferenceDate.rounded(.towardZero)
    let startTimeInterval = startDate.timeIntervalSinceReferenceDate.rounded(.towardZero)
    let nowTimeInterval = Date().timeIntervalSinceReferenceDate.rounded(.towardZero)
    
    
    let timeElapsed = nowTimeInterval - startTimeInterval
    outputBoundary.handleNewTimeInterval(timeElapsed)
    
    if finishTimeInterval <= nowTimeInterval {
      pomodoro.stop()
      timer.invalidate()
    }
  }
  
}
