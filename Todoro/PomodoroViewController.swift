//
//  PomodoroViewController.swift
//  Todoro
//
//  Created by Spencer Forrest on 16/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit
import UserNotifications

class PomodoroViewController : UIViewController {
  
  lazy var inputBoundary: InputBoundary = Factory.pomodoroInputBoundary.make()
  
  var pomodoroView: PomodoroView!
  var optionalNotificationViewController: OptionalNotificationViewController!
  var state = State.start
  
  enum State {
    case start, skip, reset
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.navigationController?.isNavigationBarHidden = false
    self.navigationItem.title = "Pomodoro"
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings",
                                                             style: .plain,
                                                             target: self,
                                                             action: #selector(rightBarButtonItemTapped))
    view.backgroundColor = UIColor.white
    pomodoroView = PomodoroView()
    view.addSubview(pomodoroView)
    setConstraints()
    setTargets()
    
    askUserNotificationPermission()
  }
  
  @objc func rightBarButtonItemTapped() {
    let parameterViewController = ParameterViewController()
    
    Factory.parameterUserInterface = parameterViewController
    Factory.parameterInputBoundary = ParameterInputBoundaryFactoryImplementation()
    Factory.parameterOutputBoundary = ParameterOutputBoundaryFactoryImplementation()
    
    navigationController?.pushViewController(parameterViewController, animated: true)
  }
  
  func applicationWillEnterForeground() {
    inputBoundary.applicationWillEnterForeground()
  }
  
  func applicationDidEnterBackground() {
    inputBoundary.applicationDidEnterBackground()
  }
  
  func askUserNotificationPermission() {
    // Request permission to display alerts and play sounds.
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {
      (granted, error) in
      self.applicationWillEnterForeground()
    }
  }
    
  @objc private func topButtonTapped() {
    inputBoundary.nextTimerButtonTapped()
  }
  
  @objc private func middleButtonTapped() {
    switch state {
    case .start:
      inputBoundary.startButtonTapped()
      break
    case .reset:
      inputBoundary.resetButtonTapped()
      break
    case .skip:
      inputBoundary.skipButtonTapped()
      break
    }
  }
  
  @objc private func stopButtonTapped() {
    inputBoundary.stopButtonTapped()
  }
  
  private func setConstraints() {
    let margin = view.layoutMarginsGuide
    let constraints = [
      pomodoroView.leftAnchor.constraint(equalTo: margin.leftAnchor),
      pomodoroView.rightAnchor.constraint(equalTo: margin.rightAnchor),
      pomodoroView.topAnchor.constraint(equalTo: margin.topAnchor),
      pomodoroView.bottomAnchor.constraint(equalTo: margin.bottomAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }
  
  private func setTargets() {
    pomodoroView.topButton.addTarget(self, action: #selector(topButtonTapped), for: .touchUpInside)
    pomodoroView.middleButton.addTarget(self, action: #selector(middleButtonTapped), for: .touchUpInside)
    pomodoroView.bottomButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
  }
}
