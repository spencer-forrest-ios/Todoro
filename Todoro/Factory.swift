//
//  UserPreferenceImplementation+Protocol.swift
//  Todoro
//
//  Created by Spencer Forrest on 20/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol UserInterfaceFactory: AnyObject {
  func make() -> UserInterface
}

protocol InputBoundaryFactory {
  func make() -> InputBoundary
}

protocol OutputBoundaryFactory {
  func make() -> OutputBoundary
}

protocol UserPreferenceFactory {
  func make() -> Parameter
}

protocol UserNotificationFactory {
  func make() -> UserNotification
}

protocol ParameterUserInterfaceFactory: AnyObject {
  func make() -> ParameterUserInterface
}

protocol ParameterInputBoundaryFactory {
  func make() -> ParameterInputBoundary
}

protocol ParameterOutputBoundaryFactory {
  func make() -> ParameterOutputBoundary
}

class Factory {
  unowned static var pomodoroUserInterface: UserInterfaceFactory!
  static var pomodoroInputBoundary: InputBoundaryFactory!
  static var pomodoroOutputBoundary: OutputBoundaryFactory!
  static var pomodoroUserPreference: UserPreferenceFactory!
  static var pomodoroUserNotification: UserNotificationFactory!
  
  unowned static var parameterUserInterface: ParameterUserInterfaceFactory!
  static var parameterInputBoundary: ParameterInputBoundaryFactory!
  static var parameterOutputBoundary: ParameterOutputBoundaryFactory!
}
