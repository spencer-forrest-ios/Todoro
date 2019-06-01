//
//  ParameterUserInterface.swift
//  Todoro
//
//  Created by Spencer Forrest on 25/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol ParameterUserInterface: AnyObject {
  func set(_: ParameterViewModel)
  
  func alertParameterSaved(_: ParameterViewModel)
}

struct ParameterViewModel {
  
  private(set) var pomodoroText: String?
  private(set) var shortRestText: String?
  private(set) var longRestText: String?
  private(set) var maxPomodoriText: String?
  
  private(set) var title: String?
  private(set) var message: String?
  private(set) var confirmation: String?
  
  init(pomodoroText: String? = nil,
       shortRestText: String? = nil,
       longRestText: String? = nil,
       maxPomodoriText: String? = nil,
       title: String? = nil,
       message: String? = nil,
       confirmation: String? = nil) {
    
    self.pomodoroText = pomodoroText
    self.shortRestText = shortRestText
    self.longRestText = longRestText
    self.maxPomodoriText = maxPomodoriText
    
    self.title = title
    self.message = message
    self.confirmation = confirmation
  }
}
