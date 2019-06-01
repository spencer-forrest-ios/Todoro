//
//  UserPreferenceImplementationTests.swift
//  TodoroTests
//
//  Created by Spencer Forrest on 13/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import XCTest
@testable import Todoro

class PomodoroUserPreferenceTests: XCTestCase {
  
  var userPreference: PomodoroParameter!
  
  var userDefaultsKeys = [
    Constant.Key.longRestDuration,
    Constant.Key.shortRestDuration,
    Constant.Key.workDuration
  ]
  
  override func setUp() {
    super.setUp()
    userPreference = PomodoroParameter()
  }
  
  override func tearDown() {
    super.tearDown()
    for key in userDefaultsKeys {
      UserDefaults.standard.set(nil, forKey: key)
    }
  }
  
  // MARK: "work duration"
  func testWorkDurationDefaultValue_ConstantWorkDuration() {
    XCTAssert(userPreference.pomodoroDuration == Constant.defaultValue.pomodoroDuration)
  }
  
  func testSetNewValueForWorkDuration_UserDefaultsEqualNewValue() {
    let newValue: Double = 10
    userPreference.pomodoroDuration = newValue
    XCTAssert(userPreference.pomodoroDuration == newValue)
    XCTAssert(UserDefaults.standard.double(forKey: Constant.Key.workDuration) == newValue)
  }
  
  // MARK: "short duration"
  func testShortRestDurationDefaultValue_ConstantShortRestDuration() {
    XCTAssert(userPreference.shortRestDuration == Constant.defaultValue.shortRestDuration)
  }
  
  func testSetNewValueForShortRestDuration_UserDefaultsEqualNewValue() {
    let newValue: Double = 10
    userPreference.shortRestDuration = newValue
    XCTAssert(userPreference.shortRestDuration == newValue)
    XCTAssert(UserDefaults.standard.double(forKey: Constant.Key.shortRestDuration) == newValue)
  }
  
  // MARK: "long duration"
  func testLongRestDurationDefaultValue_ConstantLongRestDuration() {
    XCTAssert(userPreference.longRestDuration == Constant.defaultValue.longRestDuration)
  }
  
  func testSetNewValueForLongRestDuration_UserDefaultsEqualNewValue() {
    let newValue: Double = 10
    userPreference.longRestDuration = newValue
    XCTAssert(userPreference.longRestDuration == newValue)
    XCTAssert(UserDefaults.standard.double(forKey: Constant.Key.longRestDuration) == newValue)
  }
}
