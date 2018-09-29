//
//  EntitiesDatabaseManager.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/29/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

typealias FilterWhere = String

/**
 Please note. This is **abstract** class!
 */

class EntitiesDatabaseManager <T>  {

  func saveEntities(entities: [T]) -> Completable {
    exeption()
  }

  func fetchAllEntities(filter: FilterWhere?) -> Single<[T]> {
    exeption()
  }

  func fetchFirstEntity(filter: FilterWhere?) -> Single<T?> {
    exeption()
  }

}

func exeption() -> Never {
  fatalError("Abstract function, please override it")
}

