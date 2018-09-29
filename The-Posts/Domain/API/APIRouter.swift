//
//  APIRouter.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/27/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter {
  case posts
  case post(id: String)
  case user(id: String)
  case comments(postId: String)
}

extension APIRouter: TargetType {

  var baseURL: String {
    return "https://jsonplaceholder.typicode.com"
  }

  var path: String {
    switch self {
    case .posts:
      return "/posts"
    case .post(let id):
      return "/posts/\(id)"
    case .user(let id):
      return "/user/\(id)"
    case .comments(let postId):
      return "/posts/\(postId)/comments"
    }
  }

  var method: HTTPMethod {
    switch self {
    case .posts, .post, .user, .comments:
      return .get
    }
  }

  var parameters: [String : AnyObject]? {
    switch self {
    case .posts, .post, .user, .comments:
      return nil
    }
  }

  var encoding: ParameterEncoding {
    switch self {
    case .posts, .post, .user, .comments:
      return URLEncoding()
    }
  }

  var header: [String : String]? {
    switch self {
    case .posts, .post, .user, .comments:
      return nil
    }
  }

}
