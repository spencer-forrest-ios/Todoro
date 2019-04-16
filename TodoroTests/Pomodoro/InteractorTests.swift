//
//  InteractorTests.swift
//  TodoroTests
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import XCTest

class InteractorTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    Interactor.userPreferenceFactory = UserPreferenceFactoryImplementation()
  }
  
  override func tearDown() {
    super.tearDown()
    Interactor.userPreferenceFactory = nil
  }
  
  func testExample() {
    
  }
}
