//
//  ViewController.swift
//  study009
//
//  Created by PeiYu Wang on 2019/7/29.
//  Copyright © 2019 PeiYu Wang. All rights reserved.
//触摸事件

import UIKit

class ViewController: UIViewController {
    var imageView:UIImageView!
    var isTouchInImageView:Bool=false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         self.imageView=UIImageView(image: UIImage(named: "banner"))
        self.view.addSubview(self.imageView)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch=touches.first
        let touchPoint=touch?.location(in: self.view)
        
        let imageViewFrame=self.imageView.frame
        let minX=imageViewFrame.origin.x
        let minY=imageViewFrame.origin.y
        let maxX=minX+imageViewFrame.width
        let maxY=minY+imageViewFrame.height
        
//        print(minX)
//        print(minY)
//        print(maxX)
//        print(maxY)
//
//        print(touchPoint?.x as Any)
//        print(touchPoint?.y as Any)
        if (touchPoint?.x)! >= minX && (touchPoint?.x)! <= maxX && (touchPoint?.y)! >= minY && (touchPoint?.y)! <= maxY {
            print("中")
            isTouchInImageView=true
        }
        print("手指按下")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isTouchInImageView{
            return
        }
        let touch=touches.first
        let touchPoint=touch?.location(in: self.view)
        let touchPrePoint=touch?.previousLocation(in: self.view)
        print(touchPoint?.x as Any)
        print(touchPrePoint?.x as Any)
        let disX=(touchPoint?.x)! - (touchPrePoint?.x)!
        let disY=(touchPoint?.y)! - (touchPrePoint?.y)!
        
        var centerPoint=imageView.center
        
        centerPoint.x += disX
        
        centerPoint.y += disY
        imageView.center=centerPoint
        
        
        print("滑动")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouchInImageView=false
        print("滑出视图")
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouchInImageView=false
        print("取消滑动")
    }
}

