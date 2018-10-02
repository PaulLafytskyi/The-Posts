//
//  PostRepo.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/27/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift

protocol PostRepo {
  func syncPosts() -> Observable<Void>
  func posts() -> Observable <[PostEntity]>
}
