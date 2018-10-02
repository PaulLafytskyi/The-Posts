//
//  ApplicationNavigatorLocator.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation

class ApplicationNavigatorLocator {
  private static var applicationNavigator: ApplicationNavigator?

  func populate(navigator: ApplicationNavigator) {
    ApplicationNavigatorLocator.applicationNavigator = navigator
  }

  var shared: ApplicationNavigator {
    guard let  applicationNavigator = ApplicationNavigatorLocator.applicationNavigator else {
      //Populate first
      fatalError()
    }
    return applicationNavigator
  }

}
