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
  var timeKeeper: TimeKeeper
  var timer: Timer!
  
  init() {
    parameter = Factory.pomodoroUserPreference.make()
    outputBoundary = Factory.pomodoroOutputBoundary.make()
    userNotification = Factory.pomodoroUserNotification.make()
    
    timeKeeper = TimeKeeper()
    parameter.setDefaultValue(pomodoroDuration: 25 * 60,
                              shortRestDuration: 5 * 60,
                              longRestDuration: 30 * 60)
  }
  
  func checkOnTimerStatus() {
    timeKeeper = parameter.loadTimer()
    
    if timeKeeper.isOver {
      setNextTimer()
    }
    else if timeKeeper.isRunning {
      setCurrentTimer()
    }
  }
  
  func getRestDuration(_ count: Int) -> Double {
    let isFourthPomodoro = count > 0 && count % 4 == 0
    return isFourthPomodoro ? parameter.longRestDuration : parameter.shortRestDuration
  }
  
  func invalidateTimer() {
    if timer != nil && timer.isValid {
      timer.invalidate()
    }
  }
    
  private func setCurrentTimer() {
    let duration = timeKeeper.finish! - Date().timeIntervalSinceReferenceDate
    timer = Timer.scheduledTimer(timeInterval: duration,
                                 target: self,
                                 selector: #selector(setNextTimer),
                                 userInfo: nil,
                                 repeats: false)
    
    switch timeKeeper.type {
    case .pomodoro:
      outputBoundary.setCurrentPomodoroLayout(count: timeKeeper.count)
    case .rest:
      outputBoundary.setCurrentRestLayout(count: timeKeeper.count)
    }
  }
}
