//
//  PostDetailViewModel.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 10/1/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

struct SectionItems {
  var headerTitle: String?
  var items: [DetailCellItems]
}

extension SectionItems: SectionModelType {
  init(original: SectionItems, items: [DetailCellItems]) {
    self = SectionItems(headerTitle: original.headerTitle, items: original.items)
  }
}

enum DetailCellItems {
  case author(UserEntity)
  case description(String)
  case commentsCount(Int)
}

class PostDetailViewModel {

  struct Input {
    let loadTrigger: Driver<Void>
  }

  struct Output {
    let fetching: Driver<Bool>
    let sectionItems: Driver<[SectionItems]>
  }

  let post: PostEntity
  let userRepo: UserRepo
  let commentsRepo: CommentsRepo

  init(post: PostEntity, userRepo: UserRepo, commentsRepo: CommentsRepo) {
    self.post = post
    self.userRepo = userRepo
    self.commentsRepo = commentsRepo
  }

  func transform(input: Input) -> Output {
    let activityIndicator = ActivityIndicator()
    let refreshTrigger = input
      .loadTrigger
      .startWith(())
      .asObservable()

    let syncItems = refreshTrigger.flatMapLatest {_ in
      return Observable.combineLatest(self.commentsRepo.syncComments(postId: String(self.post.id)),
                                      self.userRepo.syncUser(id: String(self.post.userId)))
        .toEmpty([SectionItems].self)

    }.asDriverOnErrorJustComplete()

    let getItems = refreshTrigger.flatMapLatest {_ in
      return Observable.combineLatest(
        self.commentsRepo.getComments(postId:String(self.post.id)),
        self.userRepo.getUser(id: String(self.post.userId))
        )
        .map{self.buildItemsModel(user: $0.1, post: self.post, comments: $0.0)}

    }.asDriverOnErrorJustComplete()

    return Output(
      fetching: activityIndicator.asDriver(),
      sectionItems: Driver.merge(syncItems,getItems))
  }

  private func buildItemsModel(user: UserEntity?,
                               post: PostEntity,
                               comments: [CommentEntity]) -> [SectionItems] {
    return [
      SectionItems(headerTitle: nil, items: [DetailCellItems.author(user!)]),
      SectionItems(headerTitle: nil, items: [DetailCellItems.description(post.body)]),
      SectionItems(headerTitle: nil, items: [DetailCellItems.commentsCount(comments.count)])
    ]
  }

}



