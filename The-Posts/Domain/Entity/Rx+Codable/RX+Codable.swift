//
//  RX+Codable.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/29/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType {

  public func mapObject<T: Codable>(type: T.Type) -> Observable<T> {
    return flatMap { data -> Observable<T> in
      let responseTuple = data as? (HTTPURLResponse, Data)

      guard let jsonData = responseTuple?.1 else {
        throw DomainError.parsingError
      }

      let decoder = JSONDecoder()
      let object = try decoder.decode(T.self, from: jsonData)
      return Observable.just(object)
    }
  }

  public func mapArray<T: Codable>(type: T.Type) -> Observable<[T]> {
    return flatMap { data -> Observable<[T]> in
      let responseTuple = data as? Response

      guard let jsonData = responseTuple?.1 else {
        throw DomainError.parsingError
      }

      let decoder = JSONDecoder()
      let objects = try decoder.decode([T].self, from: jsonData)
      return Observable.just(objects)
    }
  }
}
