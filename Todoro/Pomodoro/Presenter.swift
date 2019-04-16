//
//  Presenter.swift
//  Todoro
//
//  Created by Spencer Forrest on 16/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import Foundation

class OutputBoundaryFactoryImplementation: OutputBoundaryFactory {
  func make() -> OutputBoundary {
    return Presenter()
  }
}

class Presenter: OutputBoundary {
  func processDate(_: Date) {
    
  }
}
