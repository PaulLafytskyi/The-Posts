//
//  ApplicationAssemblyImpl.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import UIKit

final class ApplicationAssemblyImpl: ApplicationAssembly {
  var dbMigationManager: DatabaseMigrationManager
  var navigationLocator: ApplicationNavigatorLocator
  let window: UIWindow
  let navigationController: UINavigationController

  var applicationNavigator: ApplicationNavigator {
    return navigationLocator.shared
  }

  init(dataBaseMigrationManager: DatabaseMigrationManager, navigationLocator: ApplicationNavigatorLocator, window: UIWindow) {
    self.navigationController = UINavigationController()
    self.dbMigationManager = dataBaseMigrationManager
    self.navigationLocator = navigationLocator
    self.window = window
    setupApplicationNavigator(window: window, navigationController: navigationController)
  }

  func migrate() {
    dbMigationManager.migrateIfNeeded()
  }

  func configureRootScene() {
    window.rootViewController = navigationController
    applicationNavigator.goTo(scene: .postsFeed)
  }

  private func setupApplicationNavigator (window: UIWindow, navigationController: UINavigationController) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let navigator = ApplicationNavigatorImpl(window: window, navigationController: navigationController, storyboard: storyboard)
    navigationLocator.populate(navigator: navigator)
  }
}

class ApplicationAssemblyFactory{
  static func defaultAssembly(window: UIWindow) -> ApplicationAssembly {
    return ApplicationAssemblyImpl(
      dataBaseMigrationManager: DatabaseMigrationManagerFactory().defaultManager(),
      navigationLocator: ApplicationNavigatorLocator(),
      window: window
    )
  }
}
