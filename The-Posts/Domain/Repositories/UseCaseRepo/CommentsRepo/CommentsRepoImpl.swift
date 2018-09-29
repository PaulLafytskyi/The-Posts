//
//  CommentsRepoImpl.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/27/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift

final class CommentsRepoImpl: CommentsRepo {

  private let apiClient: ApiClient
  private let entitiesDatabaseManager: EntitiesDatabaseManager<CommentEntity>

  init(apiClient: ApiClient, entitiesDatabaseManager: EntitiesDatabaseManager<CommentEntity>) {
    self.apiClient = apiClient
    self.entitiesDatabaseManager = entitiesDatabaseManager
  }

  func syncComments(postId: String) -> Completable {
    return apiClient
      .sendRequest(router: APIRouter.comments(postId: postId))
      .mapArray(type: CommentEntity.self)
      .flatMap { self.entitiesDatabaseManager.saveEntities(entities: $0) }
      .asCompletable()
  }

  func getComments(postId: String) -> Single<[CommentEntity]> {
    return entitiesDatabaseManager.fetchAllEntities(filter: "postId == \(postId)")
  }

}

class CommentsRepoFactory {
  static func defaultRepo() -> CommentsRepo {
    return CommentsRepoImpl(
      apiClient: ApiClientFactory().defaultApiClient(),
      entitiesDatabaseManager: EntitiesDatabaseManagerFactory.defaultManager())
  }
}


