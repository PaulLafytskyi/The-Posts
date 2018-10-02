//
//  FeedPostsViewController.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FeedPostsViewController: UIViewController {
  private let refreshControl = UIRefreshControl()
  private let disposeBag = DisposeBag()
  @IBOutlet weak var tableView: UITableView!
  var viewModel: FeedPostsViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    setupBinding()
  }

  func configureTableView() {
    tableView.estimatedRowHeight = 100
    tableView.rowHeight = UITableView.automaticDimension
    tableView.refreshControl = refreshControl
  }

  func setupBinding() {

    let refreshTrigger = refreshControl
      .rx
      .controlEvent(.valueChanged)
      .asDriver()

    let input = FeedPostsViewModel.Input(loadTrigger: refreshTrigger, selectionTrigger: tableView.rx.itemSelected.asDriver())
    let output = viewModel.transform(input: input)

    output
      .posts
      .drive(tableView.rx.items(cellIdentifier: "FeedPostTableViewCell",
                                cellType: FeedPostTableViewCell.self))
      { _, post, cell in
        cell.titleLabel.text = post.title
        cell.bodyLabel.text = post.body
      }
      .disposed(by: disposeBag)

    output
      .fetching
      .drive(refreshControl.rx.isRefreshing)
      .disposed(by: disposeBag)

    output
      .navigate
      .drive()
      .disposed(by: disposeBag)
  }
}
