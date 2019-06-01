//
//  ParameterInputBoundary.swift
//  Todoro
//
//  Created by Spencer Forrest on 25/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol ParameterInputBoundary {
  func saveButtonTapped(pomodoro: String?,
                        shortRest: String?,
                        longRest: String?,
                        maxPomodori: String?)
  func loadParameters()
}
