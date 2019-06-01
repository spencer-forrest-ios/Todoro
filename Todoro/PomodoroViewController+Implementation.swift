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
  
  func addUnauthorizedView(requirementsTitle: String,
                           requirementsText: String,
                           instructionsTitle: String,
                           instructionsText: String) {
    
    guard unauthorizedUserNotificationView == nil else { return }
    
    navigationController?.isNavigationBarHidden = true
    
    let warningText = NSMutableAttributedString()
    warningText.append(formatAsTitle(requirementsTitle))
    warningText.append(format(requirementsText))
    warningText.append(formatAsTitle(instructionsTitle))
    warningText.append(format(instructionsText))
    
    unauthorizedUserNotificationView = UnauthorizedUserNotificationView()
    unauthorizedUserNotificationView.settingButton.addTarget(self,
                                                             action: #selector(openSettings),
                                                             for: .touchUpInside)
    unauthorizedUserNotificationView.warningLabel.attributedText = warningText
    
    view.backgroundColor = UIColor.createFromRGB(200, 200, 200)
    view.addSubview(unauthorizedUserNotificationView)
    setUserNotificationPermissionViewContraints()
  }
  
  func removeUnauthorizedView() {
    guard let _ = unauthorizedUserNotificationView else { return }
    
    navigationController?.isNavigationBarHidden = false
    
    unauthorizedUserNotificationView.settingButton.removeTarget(self, action: #selector(openSettings), for: .touchUpInside)
    unauthorizedUserNotificationView.removeFromSuperview()
    unauthorizedUserNotificationView = nil
    
    view.backgroundColor = UIColor.white
  }
  
  func setLayout(_ viewModel: ViewModel) {
    // Update Label text color
    if let color = viewModel.statusLabelColor {
      switch color {
      case .black:
        pomodoroView.statusLabel.textColor = UIColor.black
      case .blue:
        pomodoroView.statusLabel.textColor = UIColor.blue
      case .red:
        pomodoroView.statusLabel.textColor = UIColor.red
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
  
  private func formatAsTitle(_ string: String) -> NSAttributedString {
    let attributes: [NSAttributedString.Key : Any] = [
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30),
      NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue
    ]
    
    return NSAttributedString(string: string, attributes: attributes)
  }
  
  private func format(_ string: String) -> NSAttributedString {
    let attributes: [NSAttributedString.Key : Any] = [
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
    ]
    
    return NSAttributedString(string: string, attributes: attributes)
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
