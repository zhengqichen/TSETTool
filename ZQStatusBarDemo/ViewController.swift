//
//  ViewController.swift
//  ZQStatusBarDemo
//
//  Created by 雷丹 on 2019/7/19.
//  Copyright © 2019 CZQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var statusBarBackgroundView:UIView = {
        let frame = CGRect(x: 0, y: 0, width: kWidth, height: kStatusBarHeight)
        let subview = UIView(frame: frame)
        subview.backgroundColor = UIColor.init(red: 51/255.0, green: 81/255.0, blue: 162/255.0, alpha: 1)
        return subview
    }()
    
    /**列表视图*/
    lazy var tableView:UITableView = {
        let frame = CGRect(x: 0,y: kStatusBarHeight,width: kWidth,height: kHeight-kStatusBarHeight)
        let subview = UITableView(frame: frame, style: .plain)
        subview.separatorStyle  = .none
        subview.delegate        = self
        subview.dataSource      = self
        subview.backgroundColor = .clear
        if #available(iOS 11.0, *) {
            subview.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        subview.showsVerticalScrollIndicator = false
        return subview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = UIColor.white
        // 方法- 直接自定义一个背景View，这样只会更改当前ViewController状态栏背景色
        // view.addSubview(statusBarBackgroundView)
        // 方法- 通过kvc找到statusBar的背景并给它设置颜色这样会修改当前ViewController以及她的下级ViewController的状态栏颜色
        setStatusBarBackgroundColor(color: UIColor.init(red: 51/255.0, green: 81/255.0, blue: 162/255.0, alpha: 1))
        view.addSubview(tableView)
    }
    
    /// 设置当前ViewController状态栏字体颜色
    /// key:View controller-based status bar appearance
    /// value:yes
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    /// 即将加入窗口时
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    /// 视图已经消失
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    /// 
    func setStatusBarBackgroundColor(color : UIColor) {
        let statusBarWindow : UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView
        let statusBar : UIView = statusBarWindow.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = "UITableViewCell\(indexPath.row)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

