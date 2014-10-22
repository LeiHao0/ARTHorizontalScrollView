

![](http://cl.ly/image/1n0p3l2X2A3X/download/ARTHorizontalScrollView.gif)

##USAGE

1. copy `ARTHorizontalScrollView.swift` to your project
2. in your `ViewController`:

```swift
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
        
        hsv.setIndex(5) // scrollTo 5
    }

    
    func scrollViewDidSelected(horizontalScrollView: ARTHorizontalScrollView) {
        let index = "\(horizontalScrollView.mIndex)"
        
        // do something here when scrollViewDidSelected
        showLabel(index)
    }
    
```