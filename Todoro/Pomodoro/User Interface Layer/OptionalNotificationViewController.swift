//
//  OptionalNotificationViewController.swift
//  Todoro
//
//  Created by Spencer Forrest on 05/06/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit

class OptionalNotificationViewController: UIViewController {
  
  var inputBoundary: InputBoundary!
  var requirementsTitle: String!
  var requirementsText: String!
  var instructionsTitle: String!
  var instructionsText: String!
  
  var optionalNotificationView: OptionalNotificationView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let warningText = NSMutableAttributedString()
    warningText.append(formatAsTitle(requirementsTitle!))
    warningText.append(format(requirementsText!))
    warningText.append(formatAsTitle(instructionsTitle!))
    warningText.append(format(instructionsText!))
    
    optionalNotificationView = OptionalNotificationView()
    view.addSubview(optionalNotificationView)
    setUserNotificationPermissionViewContraints()
    optionalNotificationView.ignoreNotificationsButton.addTarget(self,
                                                                 action: #selector(ignoreNotificationsButtonTapped),
                                                                 for: .touchUpInside)
    optionalNotificationView.settingButton.addTarget(self,
                                                     action: #selector(openSettings),
                                                     for: .touchUpInside)
    optionalNotificationView.warningLabel.attributedText = warningText
    
    view.backgroundColor = UIColor.createFromRGB(200, 200, 200)
  }
  
  @objc func ignoreNotificationsButtonTapped() {
    inputBoundary.ignoreNotificationsButtonTapped()
  }
  
  @objc func openSettings() {
    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString)
      else { return }
    
    if UIApplication.shared.canOpenURL(settingsUrl) {
      UIApplication.shared.open(settingsUrl, completionHandler: nil)
    }
  }
  
  private func setUserNotificationPermissionViewContraints() {
    guard let view = optionalNotificationView else { return }
    
    let margin = self.view.layoutMarginsGuide
    let constraints = [
      view.leftAnchor.constraint(equalTo: margin.leftAnchor),
      view.rightAnchor.constraint(equalTo: margin.rightAnchor),
      view.topAnchor.constraint(equalTo: margin.topAnchor),
      view.bottomAnchor.constraint(equalTo: margin.bottomAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
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
