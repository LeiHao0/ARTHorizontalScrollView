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
        let labelCountOnScreen = 3
        var labelNames = [String]()
        for i in 1...15 {
            labelNames.append("test\(i)")
        }
        
        var hsv = ARTHorizontalScrollView(frame:rectMake, labelCountOnScreen: labelCountOnScreen,labelNames: labelNames, backgroundImageName:"bg")
        self.view.addSubview(hsv)
        
        hsv.delegate = self
    }
    
    func scrollViewDidSelected(horizontalScrollView: ARTHorizontalScrollView) {
        println("\(horizontalScrollView.mIndex)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

