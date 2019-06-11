//
//  PomodoUseCase+Protocol.swift
//  Todoro
//
//  Created by Spencer Forrest on 20/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

extension PomodoroUseCase: InputBoundary {
  
  func applicationWillEnterForeground() {
    self.checkOnTimerStatus()
    
    userNotification.checkPermission {
      (isAuthorized) in
      
      DispatchQueue.main.async {
        self.checkOnTimerStatus()
        
        if isAuthorized {
          self.parameter.isNotificationsOptional = false
        }
        
        if isAuthorized || self.parameter.isNotificationsOptional {
          self.outputBoundary.removeOptionalNotificationLayout(isAnimated: false)
        } else {
           self.outputBoundary.addOptionalNotificationLayout()
        }
      }
      
    }
  }
  
  func applicationDidEnterBackground() {
    invalidateTimer()
  }
  
  func ignoreNotificationsButtonTapped() {
    parameter.isNotificationsOptional = true
    outputBoundary.removeOptionalNotificationLayout(isAnimated: true)
  }
  
  @objc func setNextTimer() {
    guard timeKeeper.isRunning else { return }
    
    invalidateTimer()
    
    let isPomodoro = timeKeeper.type == .pomodoro
    let timerCount = timeKeeper.count
        
    DispatchQueue.main.async {
      if isPomodoro {
        self.outputBoundary.setNextRestLayout(count: timerCount)
      } else {
        self.outputBoundary.setNextPomodoroLayout(count: timerCount + 1)
      }
    }
  }
  
  func startButtonTapped() {
    outputBoundary.setCurrentPomodoroLayout(count: 1)
    
    let duration = parameter.pomodoroDuration
    timeKeeper.start(duration)
    parameter.save(timeKeeper)
    timer = Timer.scheduledTimer(timeInterval: duration,
                                 target: self,
                                 selector: #selector(setNextTimer),
                                 userInfo: nil,
                                 repeats: false)
    
    userNotification.setForPomodoro(duration, count: timeKeeper.count)
  }
  
  func stopButtonTapped() {
    outputBoundary.askUserToStop()
  }
  
  func skipButtonTapped() {
    outputBoundary.askUserToSkipRest()
  }
  
  func resetButtonTapped() {
    guard timeKeeper.isRunning else { return }
    
    userNotification.cancelAll()
    invalidateTimer()
    
    let isPomodoro = timeKeeper.type == .pomodoro
    let timerCount = timeKeeper.count
    
    if isPomodoro {
      outputBoundary.setNextPomodoroLayout(count: timerCount)
    } else {
      outputBoundary.setNextRestLayout(count: timerCount)
    }
    
    timeKeeper.reset()
    parameter.save(timeKeeper)
  }
  
  func agreedToSkipRest() {
    timeKeeper.skipRest()
    nextTimerButtonTapped()
  }
  
  func agreedToStop() {
    outputBoundary.setStartingLayout()
    userNotification.cancelAll()
    invalidateTimer()
    timeKeeper.stop()
    parameter.save(timeKeeper)
  }
  
  func nextTimerButtonTapped() {
    let isPomodoro = timeKeeper.type == .pomodoro
    let timerCount = timeKeeper.count
    var duration: Double = 0
    
    if isPomodoro {
      duration = getRestDuration(timerCount)
      timeKeeper.start(duration)
      userNotification.setForRest(duration, count: timeKeeper.count)
      
      self.outputBoundary.setCurrentRestLayout(count: timerCount)
    }
    else {
      duration = parameter.pomodoroDuration
      timeKeeper.start(duration)
      userNotification.setForPomodoro(duration, count: timeKeeper.count)
      
      self.outputBoundary.setCurrentPomodoroLayout(count: timerCount + 1)
    }
    
    timer = Timer.scheduledTimer(timeInterval: duration,
                                 target: self,
                                 selector: #selector(setNextTimer),
                                 userInfo: nil,
                                 repeats: false)
    parameter.save(timeKeeper)
  }
}
