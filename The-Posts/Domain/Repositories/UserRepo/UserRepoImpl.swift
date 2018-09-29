//
//  UserRepoImpl.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/27/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift

final class UserRepoImpl: UserRepo {

  func syncUser(id: String) -> Completable {
    return Completable.empty()
  }

  func getUser(id: String) -> Single<UserEntity> {
    return Single.error(DomainError.notFound)
  }

}
