//
//  ApplicationNavigatorImpl.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import UIKit

final class ApplicationNavigatorImpl: ApplicationNavigator {
  let window: UIWindow
  let navigationController: UINavigationController
  let storyboard: UIStoryboard

  init(window: UIWindow, navigationController: UINavigationController , storyboard: UIStoryboard) {
    self.window = window
    self.navigationController = navigationController
    self.storyboard = storyboard
  }

  func goTo(scene: ApplicationScene) {
    switch scene {
    case .postsFeed:
      navigateToFeed()
    case .postDetail(let post):
      navigateToPost(post: post)
    }
  }

  private func navigateToFeed() {
    let postViewController = storyboard.instantiateVC(type: FeedPostsViewController.self)
    postViewController.viewModel = FeedPostsViewModel(postRepo: PostRepoFactory.defaultRepo(), navigator: self)
    navigationController.pushViewController(postViewController, animated: true)
  }

  private func navigateToPost(post: PostEntity) {

  }
}
