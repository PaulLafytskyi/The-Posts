//
//  PostDetailViewController.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 10/1/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class PostDetailViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var viewModel: PostDetailViewModel!
  private let disposeBag = DisposeBag()

  let dataSource = RxTableViewSectionedReloadDataSource<SectionItems> (
    configureCell: { (dataSource, table, indexPath, item) in
      switch item {
      case .author(let author):
        let cell = table.dequeueReusableCell(ofType: AuthorPostDetailTalbeViewCell.self , at: indexPath)
        cell.nameLabel.text = author.name
        return cell
      case .description(let body):
        let cell = table.dequeueReusableCell(ofType: PostDetailDescriptionTableViewCell.self , at: indexPath)
        cell.bodyLabel.text = body
        return cell
      case .commentsCount(let comments):
        let cell = table.dequeueReusableCell(ofType: PostDetailCommentsTableViewCell.self , at: indexPath)
        cell.commentsLabel.text = String(comments)
        return cell
      }
    }
  )

  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    setupBinding()
  }

  func configureTableView() {
    tableView.estimatedRowHeight = 100
    tableView.rowHeight = UITableView.automaticDimension
  }

  func setupBinding() {
    let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
      .take(1)
      .mapToVoid()
      .asDriverOnErrorJustComplete()

    let input = PostDetailViewModel.Input(loadTrigger: viewWillAppear)
    let output = viewModel.transform(input: input)

    output
      .sectionItems
      .drive(tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
}
