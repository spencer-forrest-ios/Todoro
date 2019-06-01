//
//  PomodoroPresenter+Protocol.swift
//  Todoro
//
//  Created by Spencer Forrest on 20/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

extension PomodoroPresenter: OutputBoundary {
  func handleNewTimeInterval(_ timeInterval: Double) {
    print("\(timeInterval)")
  }
}
