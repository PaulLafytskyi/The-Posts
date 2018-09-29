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

class UserEntity: Object, Decodable {
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

//  required convenience init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: UserCodingKeys.self)
//    
//    self.init(
//      id: try container.decode(Int.self, forKey: .id),
//      name: try container.decode(String.self, forKey: .name),
//      userName: try container.decode(String.self, forKey: .userName),
//      email: try container.decode(String.self, forKey: .email)
//    )
//  }

}
