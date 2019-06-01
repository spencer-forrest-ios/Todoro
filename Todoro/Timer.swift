//
//  TimeKeeper
//  Todoro
//
//  Created by Spencer Forrest on 16/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

class Timer {
  
  enum Kind: String {
    case pomodoro, rest
  }
  
  private(set) var finish: TimeInterval?
  private(set) var isRunning: Bool = false
  private(set) var count: Int = 0
  private(set) var type: Kind = .rest
  
  convenience init(finish: Double?,
       isRunning: Bool,
       count: Int,
       type: String) {
    
    self.init()
    self.finish = finish
    self.isRunning = isRunning
    self.count = count
    self.type = Kind(rawValue: type) ?? Kind.pomodoro
  }
  
  func start(_ duration: Double) {
    finish = Date().timeIntervalSinceReferenceDate + duration
    isRunning = true
    
    if type == .pomodoro {
      type = .rest
    } else {
      count += 1
      type = .pomodoro
    }
  }
  
  func stop() {
    type = .rest
    finish = nil
    isRunning = false
    count = 0
  }
  
  func reset() {
    finish = nil
    
    if type == .pomodoro {
      type = .rest
      count -= 1
    } else {
      type = .pomodoro
    }
  }
  
  func skipRest() {
    if type == .pomodoro {
      type = .rest
    }
  }
}
