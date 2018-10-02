//
//  UserRepoImpl.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/27/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift

final class UserRepoImpl: UserRepo {

  private let apiClient: ApiClient
  private let entitiesDatabaseManager: EntitiesDatabaseManager<UserEntity>

  init(apiClient: ApiClient, entitiesDatabaseManager: EntitiesDatabaseManager<UserEntity>) {
    self.apiClient = apiClient
    self.entitiesDatabaseManager = entitiesDatabaseManager
  }

  func syncUser(id: String) -> Completable {
    return apiClient
      .sendRequest(router: APIRouter.user(id: id))
      .mapObject(type: UserEntity.self)
      .flatMap { self.entitiesDatabaseManager.saveEntities(entities: [$0]) }
      .asCompletable()
  }

  func getUser(id: String) -> Single<UserEntity?> {
    let user =  self.entitiesDatabaseManager.fetchFirstEntity(filter: "id == \(id)")
    return user
  }
}

class UserRepoFactory {
  static func defaultRepo() -> UserRepo {
    return UserRepoImpl(
      apiClient: ApiClientFactory().defaultApiClient(),
      entitiesDatabaseManager: EntitiesDatabaseManagerFactory.defaultManager())
  }
}

