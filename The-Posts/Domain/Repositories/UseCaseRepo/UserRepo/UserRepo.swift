//
//  UserRepo.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/27/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift

protocol UserRepo {
  func syncUser(id: String) -> Completable
  func getUser(id: String) -> Single <UserEntity?>
}
