//
//  UserInterface.swift
//  Todoro
//
//  Created by Spencer Forrest on 22/04/2019.
//  Copyright © 2019 Spencer Forrest. All rights reserved.
//

protocol UserInterface: AnyObject {
  func addOptionalNotificationView(requirementsTitle: String,
                           requirementsText: String,
                           instructionsTitle: String,
                           instructionsText: String)
  
  func removeOptionalNotificationView(isAnimated: Bool)
    
  func setLayout(_: ViewModel)
  
  func alertSkippingRest(_ title: String,
                         message: String,
                         positive: String,
                         negative: String)
  func alertStop(_ title: String,
                 message: String,
                 positive: String,
                 negative: String)
}

struct ViewModel {
  
  enum Color {
    case label, blue, red
  }
  
  private(set) var statusLabelColor: Color?
  
  private(set) var statusLabelText: String?
  private(set) var topButtonTitle: String?
  private(set) var middleButtonTitle: String?
  
  private(set) var isTopButtonHidden: Bool?
  private(set) var isMiddleButtonHidden: Bool?
  
  private(set) var isStartButton: Bool?
  private(set) var isResetButton: Bool?
  private(set) var isSkipButton: Bool?
  
  init(statusLabelColor: Color? = nil,
       statusLabelText: String? = nil,
       topButtonTitle: String? = nil,
       middleButtonTitle: String? = nil,
       isTopButtonHidden: Bool? = nil,
       isMiddleButtonHidden: Bool? = nil,
       isStartButton: Bool? = nil,
       isResetButton: Bool? = nil,
       isSkipButton: Bool? = nil) {
    
    self.statusLabelColor = statusLabelColor
    
    self.statusLabelText = statusLabelText
    self.topButtonTitle = topButtonTitle
    self.middleButtonTitle = middleButtonTitle
    
    self.isTopButtonHidden = isTopButtonHidden
    self.isMiddleButtonHidden = isMiddleButtonHidden
    
    self.isStartButton = isStartButton
    self.isResetButton = isResetButton
    self.isSkipButton = isSkipButton
  }
}
