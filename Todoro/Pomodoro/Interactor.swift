//
//  Interactor.swift
//  Todoro
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

protocol UserPreferenceFactory {
  func make() -> UserPreference
}

protocol OutputBoundaryFactory {
  func make() -> OutputBoundary
}

class Interactor {
  
  static var userPreferenceFactory: UserPreferenceFactory!
  static var outputBoundaryFactory: OutputBoundaryFactory!
  
  private var pomodoroLeft = 1
  private var pomodoroCount = 1
  
  private var pomodoro: Pomodoro
  private var userPreference: UserPreference
  private var outputBoundary: OutputBoundary
  private var timer: Timer!
  private var workDuration: TimeInterval
  private var shortRestDuration: TimeInterval
  private var longRestDuration: TimeInterval
  
  init() {
    userPreference = Interactor.userPreferenceFactory.make()
    outputBoundary = Interactor.outputBoundaryFactory.make()
    
    workDuration = userPreference.workDuration
    longRestDuration = userPreference.longRestDuration
    shortRestDuration = userPreference.shortRestDuration
    pomodoro = Pomodoro(workDuration, restDuration: shortRestDuration)
  }
  
  private func setCurrentPomodoro() {
    let actualPomodoroCount = pomodoroCount - pomodoroLeft
    guard actualPomodoroCount > 0 else { return }
    
    let isDivisibleByFour = actualPomodoroCount % 4 == 0
    let restDuration = isDivisibleByFour ? longRestDuration : shortRestDuration
    pomodoro.setTime(workDuration)
    pomodoro.setRest(restDuration)
  }
  
  @objc private func handlePomodoro() {
    let now = Date().timeIntervalSinceReferenceDate
    
    guard let finishDate = pomodoro.finishDate?.timeIntervalSinceReferenceDate,
      now.rounded(.towardZero) <= finishDate.rounded(.towardZero) else {
        pomodoro.stop()
        timer.invalidate()
        return
    }
    
    outputBoundary.processDate(Date())
  }
}

class InputBoundaryFactoryImplementation: InputBoundaryFactory {
  func make() -> InputBoundary {
    return Interactor()
  }
}

// MARK: - Conform to 'InputBoundary' protocol
extension Interactor: InputBoundary {
  
  func setWorkDuration(_ duration: Double) {
    workDuration = duration
  }
  
  func setLongRestDuration(_ duration: Double) {
    longRestDuration = duration
  }
  
  func setShortRestDuration(_ duration: Double) {
    shortRestDuration = duration
  }
  
  func setPomodoroCount(_ count: Int) {
    pomodoroCount = count
    pomodoroLeft = pomodoroCount
  }
  
  func startPomodoro() {
    pomodoro.start()
    timer = Timer.scheduledTimer(timeInterval: 1,
                                 target: self,
                                 selector: #selector(handlePomodoro),
                                 userInfo: nil,
                                 repeats: true)
  }
  
  func resetPomodoro() {
    pomodoro.stop()
    pomodoroLeft = pomodoroCount
  }
  
  func stopPomodoro() {
    timer.invalidate()
    pomodoro.stop()
    pomodoroLeft -= 1
    
    if pomodoroLeft > 0 {
      setCurrentPomodoro()
      startPomodoro()
    } else {
      pomodoroLeft = pomodoroCount
    }
  }
}
