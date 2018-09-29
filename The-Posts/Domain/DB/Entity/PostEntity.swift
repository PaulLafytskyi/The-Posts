//
//  PostEntity.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/25/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers

class PostEntity: Object, Decodable {
  
  var userId: Int = 0
  var id: Int = 0
  var title: String = ""
  var body: String = ""

  enum PostCodingKeys: String, CodingKey {
    case userId
    case id
    case title
    case body
  }

  convenience init(userId: Int, id: Int, title: String, body: String) {
    self.init()
    self.userId = userId
    self.id = id
    self.title = title
    self.body = body
  }

  required convenience init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: PostCodingKeys.self)

    self.init(
      userId: try container.decode(Int.self, forKey: .userId),
      id: try container.decode(Int.self, forKey: .id),
      title: try container.decode(String.self, forKey: .title),
      body: try container.decode(String.self, forKey: .body)
    )
  }

}
