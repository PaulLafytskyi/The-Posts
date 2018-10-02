//
//  Observable+Drive.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 10/2/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

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
