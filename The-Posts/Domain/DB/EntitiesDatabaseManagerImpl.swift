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

  override func saveEntities(entities: [T]) -> Observable<Void> {
    return Observable.create { observer in
      do {
        try self.realm.write {
          self.realm.add(entities, update: true)
          observer.onNext(())
          observer.onCompleted()
        }
      }
      catch let error {
        observer.onError(error)
      }

      return Disposables.create()
    }
  }

  override func saveEntitie(entitie: T) -> Observable<Void> {
    return Observable.create { observer in
      do {
        try self.realm.write {
          print(entitie)
          self.realm.add(entitie, update: true)
          observer.onNext(())
          observer.onCompleted()
        }
      }

      catch let error {
        observer.onError(error)
      }
      return Disposables.create()
    }
  }

  override func fetchAllEntities(filter: FilterWhere?) -> Observable<[T]> {
    return Observable.create { observer in
      guard let filter = filter else {
        observer.onNext(Array(self.realm.objects(T.self)))
        observer.onCompleted()
        return Disposables.create()
      }
      observer.onNext(Array(self.realm.objects(T.self).filter(filter)))
      observer.onCompleted()
      return Disposables.create()
    }
  }

  override func fetchFirstEntity(filter: FilterWhere?) -> Observable<T> {
    return Observable.create { observer in

      guard let filter = filter else {
        guard let object = self.realm.objects(T.self).first else {
          observer.onError(DomainError.entitieNotFound)
          return Disposables.create()
        }

        observer.onNext(object)
        observer.onCompleted()
        return Disposables.create()
      }

      guard let filtredObject = self.realm.objects(T.self).filter(filter).first else {
        observer.onError(DomainError.entitieNotFound)
        return Disposables.create()
      }

      observer.onNext(filtredObject)
      observer.onCompleted()
      return Disposables.create()
    }
  }
}

//MARK:- Factory

class EntitiesDatabaseManagerFactory {
  static func defaultManager<T: Object>() -> EntitiesDatabaseManager<T> {
    return EntitiesDatabaseManagerImpl(realm: try! Realm())
  }

}
