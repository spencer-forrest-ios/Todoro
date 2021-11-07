//
//  ParameterViewController.swift
//  Todoro
//
//  Created by Spencer Forrest on 21/05/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit

class ParameterViewController: UIViewController {
  
  lazy var inputBoundary: ParameterInputBoundary = Factory.parameterInputBoundary.make()
  var paramaterView: ParameterView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.systemBackground
    navigationItem.title = "Settings"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                        style: .plain,
                                                        target: self,
                                                        action: #selector(saveButtonTapped))
    //Looks for single or multiple taps.
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    view.addGestureRecognizer(tap)
    
    paramaterView = ParameterView()
    paramaterView.pomodoroTextField.delegate = self
    paramaterView.longRestTextField.delegate = self
    paramaterView.shortRestTextField.delegate = self
    
    view.addSubview(paramaterView)
    let margins = view.layoutMarginsGuide
    let constraints = [
      paramaterView.leftAnchor.constraint(equalTo: margins.leftAnchor),
      paramaterView.rightAnchor.constraint(equalTo: margins.rightAnchor),
      paramaterView.topAnchor.constraint(equalTo: margins.topAnchor),
      paramaterView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
    ]
    NSLayoutConstraint.setAndActivate(constraints)
    
    inputBoundary.loadParameters()
  }
  
  //Calls this function when the tap is recognized.
  @objc func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
    view.endEditing(true)
  }
  
  @objc func saveButtonTapped() {
    dismissKeyboard()
    inputBoundary.saveButtonTapped(pomodoro: paramaterView.pomodoroTextField.text,
                                   shortRest: paramaterView.shortRestTextField.text,
                                   longRest: paramaterView.longRestTextField.text)
  }
}
