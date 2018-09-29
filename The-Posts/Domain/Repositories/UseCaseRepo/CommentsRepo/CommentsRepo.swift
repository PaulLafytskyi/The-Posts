//
//  CommentsRepo.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/27/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift

protocol CommentsRepo {
  func syncComments(postId: String) -> Completable
  func getComments(postId: String) -> Single<[CommentEntity]>
}
