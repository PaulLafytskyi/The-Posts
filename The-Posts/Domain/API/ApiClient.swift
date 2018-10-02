//
//  ApiClient.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/26/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift

typealias Response = (HTTPURLResponse, Data)

protocol ApiClient {
  func sendRequest(router: TargetType) -> Observable <Response>
}

