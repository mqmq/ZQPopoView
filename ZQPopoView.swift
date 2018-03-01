//
//  ZQPopoView.swift
//  ZQPopoView
//
//  Created by ZQQ on 2018/3/1.
//  Copyright © 2018年 zhangqq. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

func RGBColor(r:CGFloat,g:CGFloat,b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func HEXColor(h:Int) -> UIColor {
    return RGBColor(r: CGFloat(((h)>>16) & 0xFF), g:   CGFloat(((h)>>8) & 0xFF), b:  CGFloat((h) & 0xFF),a:1.0)
}

func HEXColorA(h:Int,a:CGFloat) -> UIColor {
    return RGBColor(r: CGFloat(((h)>>16) & 0xFF), g:CGFloat(((h)>>8) & 0xFF), b:  CGFloat((h) & 0xFF),a:a)
}

class ZQPopoView: UIView {
    
    let height:CGFloat! = 300
    var bGView:UIButton?
    var popView:UIView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
        self.frame = CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight)
        
        bGView = UIButton(type: .custom)
        bGView?.backgroundColor = UIColor.clear
        bGView?.addTarget(self, action: #selector(didmissActionDone), for: UIControlEvents.touchUpInside)
        bGView?.frame = (self.bounds)
        self.addSubview(bGView!)
        popView = UIView(frame: CGRect.init(x: 0, y: screenHeight, width: screenWidth, height: height))
        popView?.backgroundColor = UIColor.orange
        self.addSubview(popView!)
    }
    
    class func pop() {
        
        let zqWindow:UIWindow? = UIApplication.shared.keyWindow
        let zqPopView = ZQPopoView.init(frame: CGRect.zero)
        zqWindow?.addSubview(zqPopView)
        zqPopView.makeAnimate(show: true)
    }
    
    @objc func didmissActionDone() -> Void {
        self.makeAnimate(show: false)
    }
    
    func makeAnimate(show:Bool) -> Void {
        let zqWindow:UIWindow? = UIApplication.shared.keyWindow

        if show {

            UIView.animate(withDuration: 0.3, animations: {
                self.bGView?.backgroundColor = HEXColorA(h: 0x373e56, a: 0.5)
                zqWindow?.rootViewController?.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                self.popView?.frame = CGRect.init(x: 0, y: screenHeight - self.height, width: screenWidth, height: self.height)
            }, completion: { (complete) in
                
            })
            
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.bGView?.backgroundColor = HEXColorA(h: 0x373e56, a: 0)
                zqWindow?.rootViewController?.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.popView?.frame = CGRect.init(x: 0, y: screenHeight, width: screenWidth, height: self.height)
            }, completion: { (complete) in
                self.removeFromSuperview()
            })
        }
    }
    
}
