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

class PostEntity: Object, Codable {
  
  dynamic var userId: Int = 0
  dynamic var id: Int = 0
  dynamic var title: String = ""
  dynamic var body: String = ""

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
  
  override class func primaryKey() -> String? {
    return "id"
  }

}
