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
  var id: Int = 0
  var name: String = ""
  var userName: String = ""
  var email: String = ""

  enum UserCodingKeys: String, CodingKey {
    case id
    case name
    case userName
    case email
  }

  convenience init(id: Int, name: String, userName: String, email: String) {
    self.init()
    self.id = id
    self.name = name
    self.userName = userName
    self.email = email
  }

  override class func primaryKey() -> String? {
    return "id"
  }
  
}
