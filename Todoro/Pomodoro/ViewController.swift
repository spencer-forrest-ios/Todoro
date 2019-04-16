//
//  ViewController.swift
//  Todoro
//
//  Created by Spencer Forrest on 16/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import UIKit

protocol InputBoundaryFactory {
  func make() -> InputBoundary
}

class ViewController: UIViewController {
  
  static var inputBoundaryFactory: InputBoundaryFactory!
  
  private var inputBoundary = ViewController.inputBoundaryFactory.make()
  private var presenter = Presenter()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = UIColor.cyan
  }
  
}
