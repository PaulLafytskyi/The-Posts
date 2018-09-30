//
//  DatabaseMigrationManager.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation

protocol DatabaseMigrationManager {
  func migrateIfNeeded()
}
