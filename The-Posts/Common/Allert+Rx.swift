//
//  Allert+Rx.swift
//  The-Posts
//
//  Created by Poul Lafitskiy on 10/2/18.
//  Copyright © 2018 Laytskyi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
  var showAllert: Binder<Error> {
    return Binder(self.base, binding: { (vc, error) in
      let alert = UIAlertController(title: "Ooops", message: "Something goes wrong", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
        vc.showDetailViewController(alert, sender: self)
      })
    })
  }
}
