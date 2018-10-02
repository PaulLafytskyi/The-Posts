//
//  UserEntity.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/25/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers

class UserEntity: Object, Codable {
  dynamic var id: Int = 0
  dynamic var name: String = ""
  dynamic var username: String = ""
  dynamic var email: String = ""

  enum UserCodingKeys: String, CodingKey {
    case id
    case name
    case userName
    case email
  }

  convenience init(id: Int, name: String, username: String, email: String) {
    self.init()
    self.id = id
    self.name = name
    self.username = username
    self.email = email
  }

  override class func primaryKey() -> String? {
    return "id"
  }
  
}
