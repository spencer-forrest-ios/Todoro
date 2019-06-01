//
//  PomodoroViewController.swift
//  Todoro
//
//  Created by Spencer Forrest on 16/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit

class PomodoroViewController : UIViewController {
  
  lazy var inputBoundary: InputBoundary = Factory.pomodoroInputBoundary.make()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = UIColor.green
    inputBoundary.start()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
}
