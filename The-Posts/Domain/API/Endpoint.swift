//
//  Endpoint.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/27/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation

enum Endpoint {
  case posts
  case post(id: String)
  case user(id: String)
  case comments(postId: String)

  var path: String {
    switch self {
    case .posts:
      return "/posts"
    case .post(let id):
      return "/posts/\(id)"
    case .user(let id):
      return "user/\(id)"
    case .comments(let postId):
      return "posts/\(postId)/comments"
    }

  }
}
