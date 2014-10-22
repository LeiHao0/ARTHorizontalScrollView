//
//  ARTHorizontalScrollView.swift
//  ARTHorizontalScrollView
//
//  Created by artwalk on 10/15/14.
//  Copyright (c) 2014 artwalk. All rights reserved.
//

import UIKit

protocol ARTHorizontalScrollViewDelegate {
    func scrollViewDidSelected(horizontalScrollView:ARTHorizontalScrollView)
}

class ARTHorizontalScrollView : UIView, UIScrollViewDelegate {
    
    var delegate:ARTHorizontalScrollViewDelegate?
    
    // 1 | 3 | 5 | 7
    var mLabelCountOnScreen = CGFloat(1)
    var VIEW_HEIGHT:CGFloat!
    
    var mLabelNames:[String]!
    var mBgName:String!
    var mIndex:Int!
    
    var labelWidth : CGFloat {
        get {
            return self.frame.width/mLabelCountOnScreen
        }
    }
    
    var mScrollView: UIScrollView!
    var mBgImageView: UIImageView!
    
    init (frame: CGRect , labelCountOnScreen: Int, labelNames: [String], backgroundImageName: String) {
        super.init(frame: frame)
        
        mLabelNames = labelNames
        mLabelCountOnScreen = CGFloat(labelCountOnScreen)
        VIEW_HEIGHT = frame.height
        mBgName = backgroundImageName
        
        configView()
    }

    func configView() {
        initScrollView()
        initBgImageView()
        initLabel()
        
        self.addSubview(mBgImageView)
        self.addSubview(mScrollView)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initBgImageView() {
        let bgImg = UIImage(named: mBgName)
        mBgImageView = UIImageView(image:bgImg)
        mBgImageView.frame = CGRectMake(0, 0, self.frame.width, VIEW_HEIGHT)
    }
    
    func initLabel() {
        var i=0
        for labelName in mLabelNames {
            var label = UILabel()
            label.text = labelName
            label.textAlignment = NSTextAlignment.Center
//            label.adjustsFontSizeToFitWidth = true
            label.lineBreakMode = NSLineBreakMode.ByTruncatingTail
            label.frame = CGRectMake(0, 0, self.labelWidth, VIEW_HEIGHT)
            label.frame.origin.x = self.frame.width*(CGFloat(i) + floor(mLabelCountOnScreen/2))/mLabelCountOnScreen
            mScrollView.addSubview(label)
            ++i
        }
    }
    
    func initScrollView() {
        mScrollView = UIScrollView(frame: self.frame)
        mScrollView.showsHorizontalScrollIndicator = false
        mScrollView.scrollEnabled = true
        mScrollView.frame = CGRectMake(0, 0, self.frame.width, VIEW_HEIGHT)
        mScrollView.backgroundColor = UIColor.clearColor()
        mScrollView.contentSize.width = self.frame.width*CGFloat(mLabelNames.endIndex + Int(mLabelCountOnScreen) - 1)/mLabelCountOnScreen
        mScrollView.decelerationRate = 0.2
        
        mScrollView.delegate = self
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            fixContentOffsetWithScrollView(scrollView)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        fixContentOffsetWithScrollView(scrollView)
    }
    
    func fixContentOffsetWithScrollView(scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let offset = x % labelWidth
        let fixOffset = (offset < labelWidth/2) ? -offset : (labelWidth-offset)
        
        scrollView.setContentOffset(CGPointMake(x+fixOffset, 0), animated: true)

        mIndex = Int((x+fixOffset)/labelWidth ) + 1
        
        delegate?.scrollViewDidSelected(self)
    }
    
}
