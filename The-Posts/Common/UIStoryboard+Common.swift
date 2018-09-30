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
