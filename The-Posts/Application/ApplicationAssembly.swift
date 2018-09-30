//
//  ApplicationAssembly.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import UIKit

protocol ApplicationAssembly {
  var applicationNavigator: ApplicationNavigator { get }
  func migrate()
  func configureRootScene()
  
}
