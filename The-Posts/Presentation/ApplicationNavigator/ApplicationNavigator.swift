//
//  ApplicationNavigator.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import UIKit

enum ApplicationScene {
  case postsFeed
  case postDetail(post: PostEntity)
}

protocol ApplicationNavigator {
  func goTo(scene: ApplicationScene)
}
