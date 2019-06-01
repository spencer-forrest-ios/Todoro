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
  
  func testStart_EndDatesMatch() {
    let duration = Constant.defaultValue.pomodoroDuration
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    let calculatedFinishDate = Date().timeIntervalSinceReferenceDate.rounded(.towardZero) + duration
    let finishDate = pomodoro.finishDate?.timeIntervalSinceReferenceDate.rounded(.towardZero)
    
    XCTAssert(calculatedFinishDate == finishDate)
  }
  
  func testTimeLeftWhenStart_MatchDuration() {
    let duration = Constant.defaultValue.pomodoroDuration
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    
    XCTAssert(pomodoro.remainingTime == duration)
  }
  
  func testTimeElapsedWhenStart_Zero() {
    let duration = Constant.defaultValue.pomodoroDuration
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    
    XCTAssert(pomodoro.elapsedTime == 0)
  }
  
  func testTimeLeftWhenRunning_MatchCalculatedTimeLeft() {
    let duration = Constant.defaultValue.pomodoroDuration
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(1)
    
    XCTAssert(pomodoro.remainingTime == duration - 1)
  }
  
  func testTimeElapsedWhenRunning_MatchCalculatedTimeLeft() {
    let duration = Constant.defaultValue.pomodoroDuration
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(1)
    
    XCTAssert(pomodoro.elapsedTime == 1)
  }
  
  func testTimeLeftWhenRunningLongerThanDuration_Zero() {
    let duration: Double = 1
    let sleepDuration = UInt32(duration + 1)
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    
    XCTAssert(pomodoro.remainingTime == 0)
  }
  
  func testTimeElapsedWhenRunningLongerThanDuration_Duration() {
    let duration: Double = 1
    let sleepDuration = UInt32(duration + 1)
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    
    XCTAssert(pomodoro.elapsedTime == duration)
  }
  
  func testTimeLeftBeforeStarting_Duration() {
    let pomodoro = Pomodoro(Constant.defaultValue.pomodoroDuration)
    
    XCTAssert(pomodoro.remainingTime == Constant.defaultValue.pomodoroDuration)
  }
  
  func testTimeElapsedBeforeStarting_Zero() {
    let pomodoro = Pomodoro(Constant.defaultValue.pomodoroDuration)
    
    XCTAssert(pomodoro.elapsedTime == 0)
  }
  
  func testPauseBeforeStart_ElapsedTimeIsZero() {
    let duration = Constant.defaultValue.pomodoroDuration
    let pomodoro = Pomodoro(duration)
    pomodoro.pause()
    
    XCTAssert(pomodoro.elapsedTime == 0)
    XCTAssert(pomodoro.remainingTime == duration)
  }
  
  func testPauseBeforeStart_RemainingTimeEqualDurationTime() {
    let duration = Constant.defaultValue.pomodoroDuration
    let pomodoro = Pomodoro(duration)
    pomodoro.pause()
    
    XCTAssert(pomodoro.remainingTime == duration)
  }
  
  func testPauseAfterStart_RemainingTimeMatch() {
    let sleepDuration: UInt32 = 1
    let duration: Double = 10
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    pomodoro.pause()
    let remainingTime = duration - Double(sleepDuration)
    
    XCTAssert(pomodoro.remainingTime == remainingTime)
  }
  
  func testPauseAfterStart_ElapsedTimeMatch() {
    let sleepDuration: UInt32 = 1
    let duration: Double = 10
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    pomodoro.pause()
    let elapsedTime = Double(sleepDuration)
    
    XCTAssert(pomodoro.elapsedTime == elapsedTime)
  }
  
  func testPauseAfterDuration_ElapsedTimeEqualDuration() {
    let duration: Double = 1
    let sleepDuration: UInt32 = 1 + UInt32(duration)
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    pomodoro.pause()
    
    XCTAssert(pomodoro.elapsedTime == duration)
  }
  
  func testPauseAfterDuration_RemainingTimeEqualZero() {
    let duration: Double = 1
    let sleepDuration: UInt32 = 1 + UInt32(duration)
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    pomodoro.pause()
    
    XCTAssert(pomodoro.remainingTime == 0)
  }
  
  func testStopBeforeStart_ElapsedTimeIsZero() {
    let duration = Constant.defaultValue.pomodoroDuration
    let pomodoro = Pomodoro(duration)
    pomodoro.stop()
    
    XCTAssert(pomodoro.elapsedTime == 0)
    XCTAssert(pomodoro.remainingTime == duration)
  }
  
  func testStopBeforeStart_RemainingTimeEqualDurationTime() {
    let duration = Constant.defaultValue.pomodoroDuration
    let pomodoro = Pomodoro(duration)
    pomodoro.stop()
    
    XCTAssert(pomodoro.remainingTime == duration)
  }
  
  func testStopAfterStart_RemainingTimeEqualDurationTime() {
    let sleepDuration: UInt32 = 1
    let duration: Double = 10
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    pomodoro.stop()
    
    XCTAssert(pomodoro.remainingTime == duration)
  }
  
  func testStopAfterStart_ElapsedTimeIsZero() {
    let sleepDuration: UInt32 = 1
    let duration: Double = 10
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    pomodoro.stop()
    
    XCTAssert(pomodoro.elapsedTime == 0)
  }
  
  func testStopAfterDuration_ElapsedTimeIsZero() {
    let duration: Double = 1
    let sleepDuration: UInt32 = 1 + UInt32(duration)
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    pomodoro.stop()
    
    XCTAssert(pomodoro.elapsedTime == 0)
  }
  
  func testStopAfterDuration_RemainingTimeEqualDuration() {
    let duration: Double = 1
    let sleepDuration: UInt32 = 1 + UInt32(duration)
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    pomodoro.stop()
    
    XCTAssert(pomodoro.remainingTime == duration)
  }
  
  func testResumeBeforeStarting_RemainingTimeEqualDuration() {
    let duration: Double = 2
    let pomodoro = Pomodoro(duration)
    pomodoro.resume()
    sleep(1)
    
    XCTAssert(pomodoro.remainingTime == duration)
  }
  
  func testResumeBeforeStarting_ElapsedTimeIsZero() {
    let pomodoro = Pomodoro(2)
    pomodoro.resume()
    sleep(1)
    
    XCTAssert(pomodoro.elapsedTime == 0)
  }
  
  func testResumeBeforePause_RemainingTimesMatch() {
    let duration: Double = 2
    let sleepDuration: UInt32 = 1
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    pomodoro.resume()
    sleep(sleepDuration)
    let remainingTime = duration - Double(sleepDuration)
    
    XCTAssert(pomodoro.remainingTime == remainingTime)
  }
  
  func testResumeBeforePause_ElapsedTimesMatch() {
    let duration: Double = 2
    let sleepDuration: UInt32 = 1
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    pomodoro.resume()
    sleep(sleepDuration)
    let elapsedTime = Double(sleepDuration)
    
    XCTAssert(pomodoro.elapsedTime == elapsedTime)
  }
  
  func testResumeAfterPause_RemainingTimeIsZero() {
    let duration: Double = 2
    let sleepDuration: UInt32 = 1
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    pomodoro.pause()
    
    let remainingTime = duration - Double(sleepDuration)
    XCTAssert(pomodoro.remainingTime == remainingTime)
    
    pomodoro.resume()
    sleep(sleepDuration)
    
    XCTAssert(pomodoro.remainingTime == 0)
  }
  
  func testResumeAfterPause_ElapsedTimeEqualDuration() {
    let duration: Double = 2
    let sleepDuration: UInt32 = 1
    let pomodoro = Pomodoro(duration)
    pomodoro.start()
    sleep(sleepDuration)
    pomodoro.pause()
    
    let elapsedTime = Double(sleepDuration)
    XCTAssert(pomodoro.elapsedTime == elapsedTime)
    
    pomodoro.resume()
    sleep(sleepDuration)
    
    XCTAssert(pomodoro.elapsedTime == duration)
  }
}
