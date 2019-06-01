//
//  Presenter.swift
//  Todoro
//
//  Created by Spencer Forrest on 16/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

class PomodoroPresenter {
  
  unowned var userInterface: UserInterface
  
  init() {
    userInterface = Factory.pomodoroUserInterface.make()
    print(0.0)
  }
  
}
