//
//  PomodoroTests.swift
//  TodoroTests
//
//  Created by Spencer Forrest on 11/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

import XCTest
@testable import Todoro

class PomodoroTests: XCTestCase {
  
  func testSetTime_EndOfCountdownDatesMatch() {
    let originalInterval: TimeInterval = 25 * 60
    let newInterval: TimeInterval = 10
    let countDown = Pomodoro(originalInterval)
    countDown.setTime(newInterval)
    let startingDate = Date().timeIntervalSinceReferenceDate.rounded(.towardZero)
    let endingDate = startingDate + newInterval
    countDown.start()
    
    XCTAssertNotNil(countDown.finishDate)
    XCTAssert(endingDate == countDown.finishDate?.timeIntervalSinceReferenceDate.rounded(.towardZero))
  }
  
  func testSetRest_EndOfCountdownDatesMatch() {
    let originalInterval: TimeInterval = 25 * 60
    let newInterval: TimeInterval = 10
    let countDown = Pomodoro(restDuration: originalInterval)
    countDown.setRest(newInterval)
    let startingDate = Date().timeIntervalSinceReferenceDate.rounded(.towardZero)
    let endingDate = startingDate + newInterval
    countDown.rest()
    
    XCTAssertNotNil(countDown.finishDate)
    XCTAssert(endingDate == countDown.finishDate?.timeIntervalSinceReferenceDate.rounded(.towardZero))
  }
  
  func testStart_EndOfCountdownDatesMatch() {
    let interval: TimeInterval = 25 * 60
    let countDown = Pomodoro(interval)
    let startingDate = Date().timeIntervalSinceReferenceDate.rounded(.towardZero)
    let endingDate = startingDate + interval
    countDown.start()
    
    XCTAssertNotNil(countDown.finishDate)
    XCTAssert(endingDate == countDown.finishDate?.timeIntervalSinceReferenceDate.rounded(.towardZero))
  }
  
  func testStop_EndOfCountdownDateNil() {
    let interval: TimeInterval = 25 * 60
    let countDown = Pomodoro(interval)
    countDown.start()
    countDown.stop()
    
    XCTAssertNil(countDown.finishDate)
  }
  
  func testReset_EndOfCountdownDatesMatch() {
    let interval: TimeInterval = 25 * 60
    let countDown = Pomodoro(interval)
    countDown.start()
    sleep(1)
    let newStartingDate = Date().timeIntervalSinceReferenceDate.rounded(.towardZero)
    let newEndingDate = newStartingDate + interval
    countDown.reset()
    
    XCTAssertNotNil(countDown.finishDate)
    XCTAssert(newEndingDate == countDown.finishDate?.timeIntervalSinceReferenceDate.rounded(.towardZero))
  }
  
  func testResume_EndOfCountdownDatesMatch() {
    let interval: TimeInterval = 10
    let countDown = Pomodoro(interval)
    let originalStartingDate = Date().timeIntervalSinceReferenceDate.rounded(.towardZero)
    countDown.start()
    countDown.pause()
    sleep(1)
    countDown.resume()
    let newFinishDate = originalStartingDate + interval + 1
    
    XCTAssertNotNil(countDown.finishDate)
    XCTAssert(newFinishDate == countDown.finishDate?.timeIntervalSinceReferenceDate.rounded(.towardZero))
  }
  
  func testResumeWhenNotRunning_TimeLeftAndDatesNil() {
    let interval: TimeInterval = 10
    let countDown = Pomodoro(interval)
    countDown.resume()
    
    XCTAssertNil(countDown.timeLeft)
    XCTAssertNil(countDown.startDate)
    XCTAssertNil(countDown.finishDate)
    
    countDown.start()
    countDown.stop()
    countDown.resume()
    
    XCTAssertNil(countDown.timeLeft)
    XCTAssertNil(countDown.startDate)
    XCTAssertNil(countDown.finishDate)
  }
  
  func testResumeAfterFinishDate_TimeLeftAndDatesNil() {
    let interval: TimeInterval = 1
    let countDown = Pomodoro(interval)
    countDown.start()
    sleep(2)
    countDown.resume()
    
    XCTAssertNil(countDown.timeLeft)
    XCTAssertNil(countDown.startDate)
    XCTAssertNil(countDown.finishDate)
  }
  
  func testPause_TimeLeftMatch() {
    let interval: TimeInterval = 10
    let countDown = Pomodoro(interval)
    countDown.start()
    sleep(1)
    countDown.pause()
    
    let timeLeft = interval - 1
    
    XCTAssertNotNil(countDown.timeLeft)
    XCTAssert(timeLeft == countDown.timeLeft)
  }
  
  func testPauseWhenNotRunning_TimeLeftNil() {
    let interval: TimeInterval = 10
    let countDown = Pomodoro(interval)
    countDown.pause()
    
    XCTAssertNil(countDown.timeLeft)
    
    countDown.start()
    countDown.stop()
    countDown.pause()
    
    XCTAssertNil(countDown.timeLeft)
  }
  
  func testPauseAfterFinishDate_TimeLeftNil() {
    let interval: TimeInterval = 1
    let countDown = Pomodoro(interval)
    countDown.start()
    sleep(2)
    countDown.pause()
    
    XCTAssertNil(countDown.timeLeft)
  }
}
