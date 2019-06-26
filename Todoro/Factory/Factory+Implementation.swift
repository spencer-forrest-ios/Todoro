//
//  Factory+Implementation.swift
//  Todoro
//
//  Created by Spencer Forrest on 23/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

extension PomodoroViewController: UserInterfaceFactory {
  func make() -> UserInterface {
    return self
  }
}

class InputBoundaryFactoryImplementation: InputBoundaryFactory {
  func make() -> InputBoundary {
    return PomodoroUseCase()
  }
}

class OutputBoundaryFactoryImplementation: OutputBoundaryFactory {
  func make() -> OutputBoundary {
    return PomodoroPresenter()
  }
}

class UserPreferenceFactoryImplementation: UserPreferenceFactory {
  func make() -> Parameter {
    return PomodoroParameter()
  }
}

class UserNotificationFactoryImplementation: UserNotificationFactory {
  func make() -> UserNotification {
    return UserNotificationManager()
  }
}

extension ParameterViewController: ParameterUserInterfaceFactory {  
  func make() -> ParameterUserInterface {
    return self
  }
}

class ParameterInputBoundaryFactoryImplementation: ParameterInputBoundaryFactory {
  func make() -> ParameterInputBoundary {
    return ParameterUseCase()
  }
}

class ParameterOutputBoundaryFactoryImplementation: ParameterOutputBoundaryFactory {
  func make() -> ParameterOutputBoundary {
    return ParameterPresenter()
  }
}
