//
//  ViewController.swift
//  ARTHorizontalScrollView
//
//  Created by artwalk on 10/15/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ARTHorizontalScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rectMake = CGRectMake(0, 80, self.view.frame.width, 50)
        let labelCountOnScreen = 5
        var labelNames = [String]()
        for i in 0...9 {
            labelNames.append("index\(i)")
        }
        
        var hsv = ARTHorizontalScrollView(frame:rectMake, labelCountOnScreen: labelCountOnScreen,labelNames: labelNames, backgroundImageName:"bg")
        self.view.addSubview(hsv)
        
        hsv.delegate = self
    }
    
    func scrollViewDidSelected(horizontalScrollView: ARTHorizontalScrollView) {
        let index = "\(horizontalScrollView.mIndex)"
        
        // do something here when scrollViewDidSelected
        showLabel(index)
    }
    
    func showLabel(title:String) {
        let lable = UILabel(frame: CGRectMake(0, 0, 64, 64))
        lable.center = self.view.center
        lable.text = title
        lable.font = UIFont.systemFontOfSize(32)
        lable.textAlignment = NSTextAlignment.Center
        lable.layer.cornerRadius = 10
        lable.layer.borderColor = UIColor.darkGrayColor().CGColor
        lable.layer.borderWidth = 1
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            lable.alpha = 0;
            self.view.addSubview(lable)
            }) { (finished) -> Void in
                lable.removeFromSuperview()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

