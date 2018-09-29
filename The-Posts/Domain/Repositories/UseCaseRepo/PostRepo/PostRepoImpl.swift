//
//  PostRepoImpl.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/27/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift

final class PostRepoImpl: PostRepo {
  private let apiClient: ApiClient
  private let entitiesDatabaseManager: EntitiesDatabaseManager<PostEntity>

  init(apiClient: ApiClient, entitiesDatabaseManager: EntitiesDatabaseManager<PostEntity>) {
    self.apiClient = apiClient
    self.entitiesDatabaseManager = entitiesDatabaseManager
  }
  
  func syncPosts() -> Completable {
    return apiClient
      .sendRequest(router: APIRouter.posts)
      .mapArray(type: PostEntity.self)
      .flatMap { self.entitiesDatabaseManager.saveEntities(entities: $0) }
      .asCompletable()
  }

  func posts() -> Single<[PostEntity]> {
    return self.entitiesDatabaseManager.fetchAllEntities(filter: nil)
  }
}

class PostRepoFactory {
  static func defaultRepo() -> PostRepo {
    return PostRepoImpl(
      apiClient: ApiClientFactory().defaultApiClient(),
      entitiesDatabaseManager: EntitiesDatabaseManagerFactory.defaultManager())
  }
}

