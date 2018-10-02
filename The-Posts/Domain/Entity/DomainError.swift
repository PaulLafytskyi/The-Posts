//
//  DomainError.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/29/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation

enum DomainError: Error {
  case notFound
  case parsingError
  case networkError
  case entitieNotFound
}
