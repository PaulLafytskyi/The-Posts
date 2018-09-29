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

class CommentEntity: Object, Decodable {
  
  var postId: Int = 0
  var id: Int = 0
  var name: String = ""
  var email: String = ""
  var body: String = ""

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

  required convenience init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CommentCodingKeys.self)

    self.init(
      postId: try container.decode(Int.self, forKey: .postId),
      id: try container.decode(Int.self, forKey: .id),
      name: try container.decode(String.self, forKey: .name),
      email: try container.decode(String.self, forKey: .email),
      body: try container.decode(String.self, forKey: .body)
    )
  }

}
