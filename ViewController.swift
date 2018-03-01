//
//  ViewController.swift
//  ZQPopoView
//
//  Created by ZQQ on 2018/3/1.
//  Copyright © 2018年 zhangqq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let but = UIButton(type: UIButtonType.custom)
        but.backgroundColor = UIColor.orange
        but.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        but.addTarget(self, action: #selector(popActionDone), for: UIControlEvents.touchUpInside)
        self.view.addSubview(but)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func popActionDone() {
        ZQPopoView .pop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

