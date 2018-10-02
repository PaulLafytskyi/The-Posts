//
//  UIStoryboard+Common.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 9/30/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import UIKit

extension UIStoryboard {

  func instantiateVC <T: UIViewController> (type: T.Type = T.self) -> T {

    /**Force cast is not a good practice but in this case
     I prefer found a crash on early stage,
     than just not presented controller.*/
    return instantiateViewController(withIdentifier: String(describing: T.self)) as! T
  }

}

//TODO:
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
  func dequeueReusableCell<T: Reusable>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
    guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID,
                                         for: indexPath) as? T else {
                                          fatalError()
    }
    return cell
  }
}

