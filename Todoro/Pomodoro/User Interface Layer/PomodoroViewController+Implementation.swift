//
//  PomodoroViewController+Protocol.swift
//  Todoro
//
//  Created by Spencer Forrest on 22/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit
import UserNotifications

// MARK: UserInterface
extension PomodoroViewController: UserInterface {
  
  func addOptionalNotificationView(requirementsTitle: String,
                                   requirementsText: String,
                                   instructionsTitle: String,
                                   instructionsText: String) {
    guard optionalNotificationViewController == nil else { return }
    
    self.optionalNotificationViewController = OptionalNotificationViewController()
    self.optionalNotificationViewController.inputBoundary = self.inputBoundary
    
    self.optionalNotificationViewController.requirementsTitle = requirementsTitle
    self.optionalNotificationViewController.requirementsText = requirementsText
    self.optionalNotificationViewController.instructionsTitle = instructionsTitle
    self.optionalNotificationViewController.instructionsText = instructionsText
    
    self.present(self.optionalNotificationViewController, animated: false)
  }
  
  func removeOptionalNotificationView(isAnimated: Bool) {
    guard optionalNotificationViewController != nil else { return }
    self.optionalNotificationViewController.dismiss(animated: isAnimated)
    self.optionalNotificationViewController = nil
  }
  
  func setLayout(_ viewModel: ViewModel) {
    // Update Label text color
    if let color = viewModel.statusLabelColor {
      switch color {
      case .label:
        pomodoroView.statusLabel.textColor = UIColor.label
      case .blue:
        pomodoroView.statusLabel.textColor = UIColor.systemBlue
      case .red:
        pomodoroView.statusLabel.textColor = UIColor.systemRed
      }
    }

    // Update Strings
    if let text = viewModel.statusLabelText {
      pomodoroView.statusLabel.text = text
    }

    if let title = viewModel.topButtonTitle {
      pomodoroView.topButton.setTitle(title, for: .normal)
    }

    if let title = viewModel.middleButtonTitle {
      pomodoroView.middleButton.setTitle(title, for: .normal)
    }

    // Update 'isHidden' buttons
    if let isHidden = viewModel.isMiddleButtonHidden {
      pomodoroView.middleButton.isHidden = isHidden
    }

    if let isHidden = viewModel.isTopButtonHidden {
      pomodoroView.topButton.isHidden = isHidden
    }

    // Update buttons state
    if let isStartButton = viewModel.isStartButton,
      isStartButton {
      self.state = .start
    }

    if let isSkipButton = viewModel.isSkipButton,
      isSkipButton {
      self.state = .skip
    }

    if let isResetButton = viewModel.isResetButton,
      isResetButton {
      self.state = .reset
    }
  }
  
  func alertSkippingRest(_ title: String,
                         message: String,
                         positive: String,
                         negative: String) {
    
    presentAlert(title,
                 message: message,
                 positive: positive,
                 negative: negative,
                 positiveInputHandler: inputBoundary.agreedToSkipRest)
  }
  
  func alertStop(_ title: String,
                 message: String,
                 positive: String,
                 negative: String) {
    
    presentAlert(title,
                 message: message,
                 positive: positive,
                 negative: negative,
                 positiveInputHandler: inputBoundary.agreedToStop)
  }
  
  private func presentAlert(_ title: String,
                            message: String,
                            positive: String,
                            negative: String,
                            positiveInputHandler: @escaping ()->()) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: negative, style: .cancel)
    let agreeAction = UIAlertAction(title: positive, style: .destructive) {
      alertAction in
      positiveInputHandler()
    }
    alert.addAction(agreeAction)
    alert.addAction(cancelAction)
    present(alert, animated: true, completion: nil)
  }
}

// MARK: UserNotifications
extension PomodoroViewController: UNUserNotificationCenterDelegate {
  
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
                              withCompletionHandler completionHandler:
    @escaping (UNNotificationPresentationOptions) -> Void) {
    
    inputBoundary.setNextTimer()
    // Alert the user with a sound only
    completionHandler(UNNotificationPresentationOptions.sound)
  }
}
