//
//  TargetType.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/29/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import Alamofire

protocol TargetType {
  var baseURL: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var parameters: [String: AnyObject]? { get }
  var encoding: ParameterEncoding { get }
  var header: [String: String]? { get }
}


