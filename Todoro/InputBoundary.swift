//
//  InputBoundary.swift
//  Todoro
//
//  Created by Spencer Forrest on 14/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol InputBoundary: AnyObject {
  func applicationWillEnterForeground()
  
  func setNextTimer()
  func nextTimerButtonTapped()
  func startButtonTapped()
  func resetButtonTapped()
  func skipButtonTapped()
  func stopButtonTapped()
  
  func agreedToSkipRest()
  func agreedToStop()
}
