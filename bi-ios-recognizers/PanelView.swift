//
//  PanelView.swift
//  bi-ios-recognizers
//
//  Created by Dominik Vesely on 03/11/15.
//  Copyright © 2015 Ackee s.r.o. All rights reserved.
//

import Foundation
import UIKit


class PanelView : UIView {
    
    var delegate : PanelViewDelegate?
    var onSliderChange : ((CGFloat) -> ())!
    
    
    
    weak var slider : UISlider!
    weak var stepper : UIStepper!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.lightGrayColor()
        
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 15
        slider.addTarget(self, action: "sliderChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        addSubview(slider)
        self.slider = slider
        
        let stepper = UIStepper()
        stepper.minimumValue = 0;
        stepper.maximumValue = 15;
        stepper.stepValue = 0.5;
        stepper.addTarget(self, action: "stepperChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        addSubview(stepper)
        self.stepper = stepper
        
      //  let timer = NSTimer.scheduledTimerWithTimeInterval(1/30, target: self, selector: "fireTimer:", userInfo: nil, repeats: true)
        
       // self.performSelector("invalidateTimer:", withObject: timer, afterDelay: 5)
        
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.slider.frame = CGRectMake(8, 8, CGRectGetWidth(self.bounds) - 16, 44);
        self.stepper.frame = CGRectMake(8, 8 + 44+8, CGRectGetWidth(self.bounds) - 16, 44);
        
    }
    
    
    func invalidateTimer(timer: NSTimer) {
        timer.invalidate()
    }
    
    
    //MARK: Action
    func fireTimer(timer:NSTimer) {
        var value = self.slider.value
        value += 0.01
        self.slider.value = value
        self.stepper.value = Double(value)
        sliderChanged(self.slider)
    }
    
    
    func sliderChanged(slider : UISlider) {
        onSliderChange(CGFloat(slider.value))
        //delegate?.sliderDidChange(slider, panel: self)
        //self.slider.value = Float(stepper.value)
        
    }
    
    func stepperChanged(stepper: UIStepper) {
        delegate?.stepperDidChange(stepper, panel: self)
       //stepper.value = Double(slider.value)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

protocol PanelViewDelegate {
    
    
    func sliderDidChange(slider : UISlider, panel:PanelView)
    func stepperDidChange(stepper : UIStepper, panel:PanelView)
    
}
