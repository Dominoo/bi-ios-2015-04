//
//  GraphView.swift
//  bi-ios-recognizers
//
//  Created by Dominik Vesely on 03/11/15.
//  Copyright © 2015 Ackee s.r.o. All rights reserved.
//

import Foundation
import UIKit

class GraphView : UIView {
    
    var amplitude : CGFloat = 2.0 {
        didSet {
            //print("ahoj nastavil jsem amp")
            setNeedsDisplay()
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGrayColor()
    }
    
    
    override func drawRect(rect: CGRect) {
        
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext();
        
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor);
        CGContextSetLineWidth(context, 2);
        
        CGContextMoveToPoint(context, 0, CGRectGetHeight(self.bounds) / 2.0);
        
        for (var i : CGFloat = 0; i < 900; i += 4) {
            
            CGContextAddLineToPoint(context, i, self.amplitude * 10 * sin(i) + CGRectGetHeight(self.bounds) / 2.0);
        }
        
        CGContextStrokePath(context);
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
