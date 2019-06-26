//
//  PomodoroPresenter+Protocol.swift
//  Todoro
//
//  Created by Spencer Forrest on 20/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

extension PomodoroPresenter: OutputBoundary {
  
  func askUserToSkipRest() {
    let title = "Skipping Rest"
    let messsage = "Do you want to skip it?"
    let positive = "Yes"
    let negative = "No"
    userInterface.alertSkippingRest(title,
                                    message: messsage,
                                    positive: positive,
                                    negative: negative)
  }
  
  func askUserToStop() {
    let title = "Stop all pomodori"
    let messsage = "Do you want to stop?"
    let positive = "Yes"
    let negative = "No"
    userInterface.alertStop(title,
                            message: messsage,
                            positive: positive,
                            negative: negative)
  }
  
  func addOptionalNotificationLayout() {
    
    let requirementsTitle = "Enhanced user experience with notifications:\n"
    let requirementsText =
      "\n– A banner is displayed when a timer (rest or pomodoro) is over while the app is in the 'background'\n\n"
      + "– A sound is played when a timer (rest or pomodoro) is over while the app is in the 'foreground'\n\n"
    
    let instructionsTitle = "How to activate:\n"
    let instructionsText =
      "\n1) Tap 'Go to Settings'\n"
      + "2) Select 'Notifications'\n"
      + "3) Activate 'Allow Notifications'\n"
      + "4) Activate 'Banners'\n"
      + "5) Activate 'Sounds'\n"
    
    userInterface.addOptionalNotificationView(requirementsTitle: requirementsTitle,
                                      requirementsText: requirementsText,
                                      instructionsTitle: instructionsTitle,
                                      instructionsText: instructionsText)
  }
  
  func removeOptionalNotificationLayout(isAnimated: Bool) {
    userInterface.removeOptionalNotificationView(isAnimated: isAnimated)
  }
  
  func setCurrentPomodoroLayout(count: Int) {
    let text = "Pomodoro \(count) in progress"
    let title = "Reset Pomodoro \(count)"
    
    let viewModel = ViewModel(statusLabelColor: .red,
                              statusLabelText: text,
                              middleButtonTitle: title,
                              isTopButtonHidden: true,
                              isMiddleButtonHidden: false,
                              isResetButton: true)
    
    userInterface.setLayout(viewModel)
  }
  
  func setCurrentRestLayout(count: Int) {
    let text = "Rest \(count) in progress"
    let title = "Reset Rest \(count)"
    
    let viewModel = ViewModel(statusLabelColor: .blue,
                              statusLabelText: text,
                              middleButtonTitle: title,
                              isTopButtonHidden: true,
                              isMiddleButtonHidden: false,
                              isResetButton: true)
    userInterface.setLayout(viewModel)
  }
  
  func setStartingLayout() {
    let text = "Waiting to Start a new Cycle"
    let title = "Start"
    
    let viewModel = ViewModel(statusLabelColor: .black,
                              statusLabelText: text,
                              middleButtonTitle: title,
                              isTopButtonHidden: true,
                              isMiddleButtonHidden: false,
                              isStartButton: true)
    
    
    userInterface.setLayout(viewModel)
  }
    
  func setNextPomodoroLayout(count: Int) {
    let text = "Waiting for Pomodoro \(count) to start"
    let title = "Start Pomodoro \(count)"
    
    let viewModel = ViewModel(statusLabelColor: .black,
                              statusLabelText: text,
                              topButtonTitle: title,
                              isTopButtonHidden: false,
                              isMiddleButtonHidden: true)
    
    userInterface.setLayout(viewModel)
  }
  
  func setNextRestLayout(count: Int) {
    let text = "Waiting for Rest \(count) to start"
    let topTitle = "Start Rest \(count)"
    let middleTitle = "Skip Rest \(count)"
    
    let viewModel = ViewModel(statusLabelColor: .black,
                              statusLabelText: text,
                              topButtonTitle: topTitle,
                              middleButtonTitle: middleTitle,
                              isTopButtonHidden: false,
                              isMiddleButtonHidden: false,
                              isSkipButton: true)
    
    userInterface.setLayout(viewModel)
  }
}
