//
//  UITableViewCell+Reusable.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 10/2/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import UIKit

protocol Reusable {
  static var reuseID: String {get}
}

extension Reusable {
  static var reuseID: String {
    return String(describing: self)
  }
}

extension UITableViewCell: Reusable {}

extension UITableView {
  func dequeueReusableCell<T: Reusable>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID,
                                         for: indexPath) as? T else {
                                          fatalError()
    }
    return cell
  }
}
