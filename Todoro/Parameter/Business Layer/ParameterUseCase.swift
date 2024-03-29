//
//  ParameterUseCase.swift
//  Todoro
//
//  Created by Spencer Forrest on 25/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

class ParameterUseCase: ParameterInputBoundary {
  var outputBoundary: ParameterOutputBoundary
  var parameter: Parameter
  
  init() {
    outputBoundary = Factory.parameterOutputBoundary.make()
    parameter = Factory.pomodoroUserPreference.make()
  }
  
  func saveButtonTapped(pomodoro: String?,
                        shortRest: String?,
                        longRest: String?) {
    
    if let pomodoro = pomodoro, !pomodoro.isEmpty {
      let minimum: Double = 5 * 60
      let duration = (Double(pomodoro) ?? 25) * 60
      parameter.pomodoroDuration = duration < minimum ? minimum : duration
    }
    
    if let shortRest = shortRest, !shortRest.isEmpty {
      let minimum: Double = 5 * 60
      let duration = (Double(shortRest) ?? 5) * 60
      parameter.shortRestDuration = duration < minimum ? minimum : duration
    }
    
    if let longRest = longRest, !longRest.isEmpty {
      let minimum: Double = 5 * 60
      let duration = (Double(longRest) ?? 30) * 60
      parameter.longRestDuration = duration < minimum ? minimum : duration
    }
    
    outputBoundary.setParameters(pomodoroDuration: parameter.pomodoroDuration,
                                 shortRestDuration: parameter.shortRestDuration,
                                 longRestDuration: parameter.longRestDuration)
    outputBoundary.noticeParametersChanged()
  }
  
  func loadParameters() {
    outputBoundary.setParameters(pomodoroDuration: parameter.pomodoroDuration,
                                 shortRestDuration: parameter.shortRestDuration,
                                 longRestDuration: parameter.longRestDuration)
  }
}
