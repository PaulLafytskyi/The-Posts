//
//  ApiClientImpl.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/26/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

final class ApiClientImpl: ApiClient {
  let scheduler: SchedulerType
  let manager: SessionManager

  init(scheduler: SchedulerType, manager: SessionManager) {
    self.scheduler = scheduler
    self.manager = manager
  }

  func sendRequest(router: TargetType) -> Observable <Response> {
    return manager.rx.request(
      router.method,
      router.baseURL + router.path,
      parameters: router.parameters,
      encoding: router.encoding,
      headers: router.header
      )
    .validate()
    .responseData()
  }
}

final class ApiClientFactory {

  func defaultApiClient() -> ApiClient {
    return ApiClientImpl(
      scheduler: ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: .background,relativePriority: 1)),
      manager: SessionManager.default
    )
  }
}
