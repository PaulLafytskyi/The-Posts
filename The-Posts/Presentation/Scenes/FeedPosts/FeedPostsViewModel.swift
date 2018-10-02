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
  }

  private let postRepo: PostRepo
  private let navigator: ApplicationNavigator


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
      }
      .flatMap {_ in
        return self.postRepo.posts()
      }
      .trackActivity(activityIndicator)
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
      navigate:navigationToPost
    )
  }
}



extension ObservableType {

  func catchErrorJustComplete() -> Observable<E> {
    return catchError { _ in
      return Observable.empty()
    }
  }

  func asDriverOnErrorJustComplete() -> Driver<E> {
    return asDriver { _ in
      return Driver.empty()
    }
  }

  func mapToVoid() -> Observable<Void> {
    return map { _ in }
  }

  func toEmpty<T>(_ type: T.Type) -> Observable<T> {
    return flatMap { _ in
      return Observable<T>.empty()
    }
  }
}
