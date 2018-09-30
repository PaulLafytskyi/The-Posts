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

    let newpost = input.loadTrigger.asObservable()
      .flatMapLatest {_ in
        return self.postRepo.syncPosts()
          .catchError{ error in
            print(error)
            return Completable.empty()}
          .andThen(self.postRepo.posts())
    }
      .asObservable()
      .trackActivity(activityIndicator)
      .asDriverOnErrorJustComplete()



//    let trigger = input.loadTrigger.asDriver()

//
//    let posts = trigger.asObservable()
//      .flatMapLatest {_ in
//        return self.postRepo.syncPosts()
//          .catchError{_ in
//            return Completable.empty()
//          }
//          .andThen(self.postRepo.posts())
//      }
//      .trackActivity(activityIndicator)
//      .asDriver(onErrorJustReturn: [PostEntity]())


    let navigationToPost = input.selectionTrigger
      .withLatestFrom(newpost) { indexPath, items -> PostEntity in
        return items[indexPath.row]
      }
      .do(onNext: { post in
        self.navigator.goTo(scene: .postDetail(post: post))
      })

    return Output(
      posts: newpost,
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
