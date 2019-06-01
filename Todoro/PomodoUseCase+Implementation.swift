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
    
    userNotification.checkPermission {
      (isAuthorized) in
      
      DispatchQueue.main.async {
        if isAuthorized {
          self.outputBoundary.setAuthorizedLayout()
          self.checkOnTimerStatus()
        } else {
          self.outputBoundary.setUnauthorizedLayout()
          self.timer.stop()
          self.parameter.save(self.timer)
        }
      }
      
    }
  }
    
  func setNextTimer() {
    guard timer.isRunning else { return }
    
    userNotification.cancelAll()
    
    let isPomodoro = timer.type == .pomodoro
    let timerCount = timer.count
    let maxCountReached = timerCount == parameter.maxPomodori
    
    if isPomodoro && maxCountReached {
      timer.stop()
      parameter.save(timer)
      
      DispatchQueue.main.async {
        self.outputBoundary.setEndLayout()
      }
      return
    }
    
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
    timer.start(duration)
    parameter.save(timer)
    
    userNotification.setForPomodoro(duration, count: timer.count)
  }
  
  func stopButtonTapped() {
    outputBoundary.askUserToStop()
  }
  
  func skipButtonTapped() {
    outputBoundary.askUserToSkipRest()
  }
  
  func resetButtonTapped() {
    guard timer.isRunning else { return }
    
    userNotification.cancelAll()
    
    let isPomodoro = timer.type == .pomodoro
    let timerCount = timer.count
    
    if isPomodoro {
      outputBoundary.setNextPomodoroLayout(count: timerCount)
    } else {
      outputBoundary.setNextRestLayout(count: timerCount)
    }
    
    timer.reset()
    parameter.save(timer)
  }
  
  func agreedToSkipRest() {
    timer.skipRest()
    nextTimerButtonTapped()
  }
  
  func agreedToStop() {
    outputBoundary.setStartingLayout()
    userNotification.cancelAll()
    timer.stop()
    parameter.save(timer)
  }
  
  func nextTimerButtonTapped() {
    let isPomodoro = timer.type == .pomodoro
    let timerCount = timer.count
    
    if isPomodoro {
      let duration = getRestDuration(timerCount)
      timer.start(duration)
      userNotification.setForRest(duration, count: timer.count)
      
      self.outputBoundary.setCurrentRestLayout(count: timerCount)
    }
    else {
      let duration = parameter.pomodoroDuration
      timer.start(duration)
      userNotification.setForPomodoro(duration, count: timer.count)
      
      self.outputBoundary.setCurrentPomodoroLayout(count: timerCount + 1)
    }
    
    parameter.save(timer)
  }
}
