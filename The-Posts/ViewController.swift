//
//  ViewController.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/25/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

  let disposbag = DisposeBag()
  let postRepo = PostRepoFactory.defaultRepo()

  override func viewDidLoad() {
    super.viewDidLoad()

    postRepo.syncPosts()
    .andThen(self.postRepo.posts())
      .subscribe(onSuccess: { (ent) in
        print(ent)

      }) { (error) in
        print(error)
    }


  }


}

