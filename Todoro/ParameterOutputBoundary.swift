//
//  ParameterOutputBoundary.swift
//  Todoro
//
//  Created by Spencer Forrest on 25/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol ParameterOutputBoundary {
  func setParameters(pomodoroDuration: Double,
                     shortRestDuration: Double,
                     longRestDuration: Double)
  func noticeParametersChanged()
}
