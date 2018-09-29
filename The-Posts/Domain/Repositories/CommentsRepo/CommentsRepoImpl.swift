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

  func syncComments(postId: String) -> Completable {
    return Completable.empty()
  }

  func getComments(postId: String) -> Single<[CommentEntity]> {
    return Single.just([CommentEntity]())
  }

}
