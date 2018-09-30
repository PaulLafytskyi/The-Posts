//
//  AppDelegate.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/25/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  var applicationAssembly: ApplicationAssembly!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.makeKeyAndVisible()
    applicationAssembly = ApplicationAssemblyFactory.defaultAssembly(window: window)
    applicationAssembly.migrate()
    applicationAssembly.configureRootScene()
    self.window = window
    return true
  }

}

