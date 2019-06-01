//
//  ParameterPresenter.swift
//  Todoro
//
//  Created by Spencer Forrest on 25/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

class ParameterPresenter: ParameterOutputBoundary {
  unowned var userInterface: ParameterUserInterface
  
  init() {
    userInterface = Factory.parameterUserInterface.make()
  }
  
  func setParameters(pomodoroDuration: Double,
                     shortRestDuration: Double,
                     longRestDuration: Double,
                     maxPomodori: Int) {
    
    let pomodoro = pomodoroDuration / 60
    let shortRest = shortRestDuration / 60
    let longRest = longRestDuration / 60
    
    let parameterViewModel = ParameterViewModel(pomodoroText: "\(Int(pomodoro))",
                                                shortRestText: "\(Int(shortRest))",
                                                longRestText: "\(Int(longRest))",
                                                maxPomodoriText: "\(maxPomodori)")
    
    userInterface.set(parameterViewModel)
  }
  
  func noticeParametersChanged() {
    let parameterViewModel = ParameterViewModel(title: "Parameters Saved",
                                                message: "Parameters have been updated",
                                                confirmation: "OK")
    userInterface.alertParameterSaved(parameterViewModel)
  }
}
