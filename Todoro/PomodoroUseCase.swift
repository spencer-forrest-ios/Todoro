//
//  PomodoroUseCase.swift
//  Todoro
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

class PomodoroUseCase {
  
  var outputBoundary: OutputBoundary
  var parameter: Parameter
  var userNotification: UserNotification
  var timer: Timer
  
  init() {
    parameter = Factory.pomodoroUserPreference.make()
    outputBoundary = Factory.pomodoroOutputBoundary.make()
    userNotification = Factory.pomodoroUserNotification.make()
    
    timer = Timer()
    parameter.setDefaultValue(pomodoroDuration: 25 * 60,
                              shortRestDuration: 5 * 60,
                              longRestDuration: 30 * 60,
                              maxPomodori: 5)
  }
  
  func checkOnTimerStatus() {
    timer = parameter.loadTimer()
    
    if timer.isOver {
      setNextTimer()
    }
    else if timer.isRunning {
      setCurrentTimer()
    }
  }
  
  func getRestDuration(_ count: Int) -> Double {
    let isFourthPomodoro = count > 0 && count % 4 == 0
    return isFourthPomodoro ? parameter.longRestDuration : parameter.shortRestDuration
  }
  
  private func setCurrentTimer() {
    switch timer.type {
    case .pomodoro:
      outputBoundary.setCurrentPomodoroLayout(count: timer.count)
    case .rest:
      outputBoundary.setCurrentRestLayout(count: timer.count)
    }
  }
}
