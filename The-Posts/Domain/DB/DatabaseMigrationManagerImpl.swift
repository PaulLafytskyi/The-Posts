//
//  DatabaseMigrationManagerImpl.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseMigrationManagerImpl: DatabaseMigrationManager {
  func migrateIfNeeded() {
    let config = Realm.Configuration(schemaVersion: 2)
    Realm.Configuration.defaultConfiguration = config
  }
}

class DatabaseMigrationManagerFactory {
  func defaultManager() -> DatabaseMigrationManager {
    return DatabaseMigrationManagerImpl()
  }
}
