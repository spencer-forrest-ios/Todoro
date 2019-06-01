//
//  PomodoUseCase+Protocol.swift
//  Todoro
//
//  Created by Spencer Forrest on 20/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

extension PomodoroUseCase: InputBoundary {
  
  func start() {
    pomodoro.start()
    timer = Timer.scheduledTimer(timeInterval: 1.0,
                                 target: self,
                                 selector: #selector(sendNewTimeInterval(_:)),
                                 userInfo: nil,
                                 repeats: true)
    RunLoop.current.add(timer, forMode: .common)
  }
  
}
