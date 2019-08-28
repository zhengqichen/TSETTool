//
//  ZQNavigationController.swift
//  ZQStatusBarDemo
//
//  Created by 雷丹 on 2019/7/19.
//  Copyright © 2019 CZQ. All rights reserved.
//

import UIKit

class ZQNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func childViewControllerForStatusBarStyle() -> UIViewController? {
        return self.topViewController
    }


}
