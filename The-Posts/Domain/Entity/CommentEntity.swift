//
//  CommentEntity.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/25/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers

class CommentEntity: Object, Codable {
  
  dynamic var postId: Int = 0
  dynamic var id: Int = 0
  dynamic var name: String = ""
  dynamic var email: String = ""
  dynamic var body: String = ""

  enum CommentCodingKeys: String, CodingKey {
    case postId
    case id
    case name
    case email
    case body
  }

  convenience init(postId: Int, id: Int, name: String, email: String, body: String) {
    self.init()
    self.postId = postId
    self.id = id
    self.name = name
    self.email = email
    self.body = body
  }

  override class func primaryKey() -> String? {
    return "id"
  }

}
