//
//  ViewController.swift
//  ARTHorizontalScrollView
//
//  Created by artwalk on 10/15/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rm = CGRectMake(0, 80, self.view.frame.width, 50)

        var labelNames = [String]()
        
        for i in 1...20 {
            labelNames.append("test\(i)")
        }
        
        var hsv = ARTHorizontalScrollView(frame:rm, labelCountOnScreen: 5,labelNames: labelNames)
        self.view.addSubview(hsv)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

