//
//  OutputBoundary.swift
//  Todoro
//
//  Created by Spencer Forrest on 14/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol OutputBoundary {
  func setUnauthorizedLayout()
  func setAuthorizedLayout()
  
  func setCurrentPomodoroLayout(count: Int)
  func setCurrentRestLayout(count: Int)
  func setNextRestLayout(count: Int)
  func setNextPomodoroLayout(count: Int)
  func setStartingLayout()
  func setEndLayout()
  
  func askUserToSkipRest()
  func askUserToStop()
}
