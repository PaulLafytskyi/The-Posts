//
//  FeedPostsViewModel.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class FeedPostsViewModel {
  struct Input {
    let loadTrigger: Driver<Void>
    let selectionTrigger: Driver<IndexPath>
  }

  struct Output {
    let posts: Driver<[PostEntity]>
    let fetching: Driver<Bool>
    let navigate: Driver<PostEntity>
    let error: Driver<Error>
  }

  private let postRepo: PostRepo
  private let navigator: ApplicationNavigator
  private let errorSubject = PublishSubject<Error>()

  init(postRepo: PostRepo, navigator: ApplicationNavigator) {
    self.postRepo = postRepo
    self.navigator = navigator
  }

  func transform(input: Input) -> Output {

    let activityIndicator = ActivityIndicator()

    let triger = input.loadTrigger
      .startWith(())
      .asObservable()

    let posts = triger.flatMapLatest { _ in
      return self.postRepo.syncPosts()
      .catchError{ error in
        self.errorSubject.onNext(error)
        return Observable.just(()) }
      .trackActivity(activityIndicator)
      }
      .flatMap {_ in
        return self.postRepo.posts()
      }
      .observeOn(MainScheduler.instance)
      .asDriverOnErrorJustComplete()

    let navigationToPost = input.selectionTrigger
      .withLatestFrom(posts) { indexPath, items -> PostEntity in
        return items[indexPath.row]
      }
      .do(onNext: { post in
        self.navigator.goTo(scene: .postDetail(post: post))
      })

    return Output(
      posts: posts,
      fetching: activityIndicator.asDriver(),
      navigate:navigationToPost,
      error: errorSubject.asObserver().asDriverOnErrorJustComplete()
    )
  }
}
