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
  
  func syncPosts() -> Completable {
    return Completable.empty()
  }

  func posts() -> Single<[PostEntity]> {
    return Single.just([PostEntity]())
  }

}
