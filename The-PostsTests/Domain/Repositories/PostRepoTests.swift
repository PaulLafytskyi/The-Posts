//
//  PostRepoTests.swift
//  The-PostsTests
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Cuckoo
import RealmSwift
import RxSwift
import RxTest
import RxBlocking


@testable import The_Posts

class PostRepoTests: QuickSpec {
  override func spec() {
    super.spec()
    beforeSuite {
      Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }

    describe("PostRepo") {
      var sut: PostRepoImpl!
      var mockApiClient: MockApiClient!
      var entitiesDatabaseManager: EntitiesDatabaseManager<PostEntity>!
      var mockRealm: Realm!
      beforeEach {
        mockRealm = try! Realm()
        try! mockRealm.write {
          mockRealm.deleteAll()
        }
        entitiesDatabaseManager = EntitiesDatabaseManagerImpl(realm: mockRealm)
        mockApiClient = MockApiClient()
        sut = PostRepoImpl(
          apiClient: mockApiClient,
          entitiesDatabaseManager: entitiesDatabaseManager
        )
        let response  = HTTPURLResponse()
        let data = MockedPost.data()
        stub(mockApiClient, block: { (proxy) in
          when(proxy.sendRequest(router: any()))
            .thenReturn(Observable.just((Response(response,data))))
        })
      }
      describe("When sync post", {
        it("Should ask api client for data ", closure: {
          _ =  sut.syncPosts().toBlocking()
          verify(mockApiClient).sendRequest(router: any())
        })
      })

      describe("When ask for stored item", {
        it("Item should exist", closure: {
          try! mockRealm.write {
            mockRealm.add(PostEntity(userId: 1, id: 1, title: "", body: ""))
          }
          try! expect(sut.posts().toBlocking().first()!.count).to(equal(1))
        })
      })
    }
  }
}

class MockedPost {
  static func data () -> Data {
    let entity  = PostEntity(userId: 1, id: 1, title: "mock", body: "mock")
    let jsonEncoder = JSONEncoder()
    return try! jsonEncoder.encode(entity)
  }
}
