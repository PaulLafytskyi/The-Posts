//
//  EntitiesDatabaseManagerImpl.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/29/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

//MARK:- EntitiesDatabaseManagerImpl

class EntitiesDatabaseManagerImpl <T: Object> : EntitiesDatabaseManager<T>  {
  private let realm: Realm

  init(realm: Realm) {
    self.realm = realm
  }

  override func saveEntities(entities: [T]) -> Completable {
    return Completable.create {[weak self] (completable) -> Disposable in
      do {
        try self?.realm.write {
          self?.realm.add(entities, update: true)
          completable(.completed)
        }
      }

      catch let error {
        completable(.error(error))
      }

      return Disposables.create()
    }
  }

  override func fetchAllEntities(filter: FilterWhere?) -> Single<[T]> {
    guard let filter = filter else {
      return Single.just(Array(realm.objects(T.self)))
//      return Single.create(subscribe: { (single) -> Disposable in
//        single(.success(Array(self.realm.objects(T.self))))
//        return Disposables.create()
//      })
    }

    return Single.just(Array(realm.objects(T.self).filter(filter)))
  }

  override func fetchFirstEntity(filter: FilterWhere?) -> Single<T?> {
    guard let filter = filter else {
      return Single.just(realm.objects(T.self).first)
    }

    return Single.just(realm.objects(T.self).filter(filter).first)
  }
}

//MARK:- Factory

class EntitiesDatabaseManagerFactory {
  static func defaultManager<T: Object>() -> EntitiesDatabaseManager<T> {
    return EntitiesDatabaseManagerImpl(realm: try! Realm())
  }

}
