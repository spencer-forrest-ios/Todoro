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
  
  var userPreferenceFactory: UserPreferenceFactory!
  var userPreference: UserPreference!
  
  var userDefaultsKeys = [
    Constant.Key.isIdleTimerDisabled,
    Constant.Key.longRestDuration,
    Constant.Key.shortRestDuration,
    Constant.Key.workDuration
  ]
  
  override func setUp() {
    super.setUp()
    userPreferenceFactory = UserPreferenceFactoryImplementation()
    userPreference = userPreferenceFactory.make()
  }
  
  override func tearDown() {
    super.tearDown()
    for key in userDefaultsKeys {
      UserDefaults.standard.set(nil, forKey: key)
    }
  }
  
  // MARK: "is idle time disabled"
  func testIsIdleTimeDisabledByDefault_True() {
    XCTAssert(userPreference.isIdleTimerDisable)
  }
  
  func testSetIsIdleTimeDisabledToTrue_UserDefaultsTrue() {
    userPreference.isIdleTimerDisable = true
    XCTAssert(userPreference.isIdleTimerDisable)
    XCTAssert(UserDefaults.standard.bool(forKey: Constant.Key.isIdleTimerDisabled))
  }
  
  func testSetIsIdleTimeDisabledToFalse_UserDefaultsFalse() {
    userPreference.isIdleTimerDisable = false
    XCTAssertFalse(userPreference.isIdleTimerDisable)
    XCTAssertFalse(UserDefaults.standard.bool(forKey: Constant.Key.isIdleTimerDisabled))
  }
  
  // MARK: "work duration"
  func testWorkDurationDefaultValue_ConstantWorkDuration() {
    XCTAssert(userPreference.workDuration == Constant.defaultValue.workDuration)
  }
  
  func testSetNewValueForWorkDuration_UserDefaultsEqualNewValue() {
    let newValue: Double = 10
    userPreference.workDuration = newValue
    XCTAssert(userPreference.workDuration == newValue)
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
