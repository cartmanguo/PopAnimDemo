//
//  PopMenuView.swift
//  Pop学习
//
//  Created by randy on 16/3/3.
//  Copyright © 2016年 randy. All rights reserved.
//

import UIKit
import pop
class ClosureButton:UIButton
{
    var tappedBlock:((index:Int)->())?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: "tappedButton", forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tappedButton()
    {
        self.tappedBlock!(index: self.tag)
    }
}
class PopMenuView: UIView {
    var backgroundView:UIView?
    var topButtons:[ClosureButton]!
    var bottomButtons:[ClosureButton]!
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    let buttonSize = CGSizeMake(80, 100)
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundView = UIView(frame: frame)
        self.addSubview(backgroundView!)
        setupButtons()
        placeButtons()
    }
    
    func placeButtons()
    {
        for btn in topButtons
        {
            btn.center.y += 500
        }
        
        for btn in bottomButtons
        {
            btn.center.y += 500
        }
    }
    
    func setupButtons()
    {
        let gap:CGFloat = 40
        let topY = (screenHeight - buttonSize.height * 2 - 40)/2
        let bottomY = topY + buttonSize.height + gap
        let horiGap = (screenWidth - 80 * 3) / 4
        let middleX = center.x - buttonSize.width/2
        let leftX = middleX - horiGap - buttonSize.width
        let rightX = middleX + buttonSize.width + horiGap
        let btn1 = ClosureButton(type: .Custom)
        btn1.frame.origin = CGPoint(x: leftX,y: topY)
        btn1.frame.size = buttonSize
        btn1.setBackgroundImage(UIImage(named: "1.jpg"), forState: .Normal)
        backgroundView!.addSubview(btn1)
        let btn2 = ClosureButton(type: .Custom)
        btn2.frame.origin = CGPoint(x: middleX,y: topY)
        btn2.frame.size = buttonSize

        btn2.setBackgroundImage(UIImage(named: "2.jpg"), forState: .Normal)
        backgroundView!.addSubview(btn2)
        let btn3 = ClosureButton(type: .Custom)
        btn3.frame.origin = CGPoint(x: rightX,y: topY)
        btn3.frame.size = buttonSize

        btn3.setBackgroundImage(UIImage(named: "3.jpg"), forState: .Normal)
        backgroundView!.addSubview(btn3)
        
        let btn4 = ClosureButton(type: .Custom)
        btn4.frame.origin = CGPoint(x: leftX,y: bottomY)
        btn4.frame.size = buttonSize
        
        btn4.setBackgroundImage(UIImage(named: "4.jpg"), forState: .Normal)
        backgroundView!.addSubview(btn4)
        
        let btn5 = ClosureButton(type: .Custom)
        btn5.frame.origin = CGPoint(x: middleX,y: bottomY)
        btn5.frame.size = buttonSize
        
        btn5.setBackgroundImage(UIImage(named: "5.jpg"), forState: .Normal)
        backgroundView!.addSubview(btn5)
        
        let btn6 = ClosureButton(type: .Custom)
        btn6.frame.origin = CGPoint(x: rightX,y: bottomY)
        btn6.frame.size = buttonSize
        
        btn6.setBackgroundImage(UIImage(named: "6.jpg"), forState: .Normal)
        backgroundView!.addSubview(btn6)
        topButtons = [btn1,btn2,btn3]
        bottomButtons = [btn4,btn5,btn6]
    }
    
    func showButtons(tappedBlock:(index:Int)->())
    {
        for btn in topButtons
        {
            let anim = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
            anim.fromValue = btn.center.y
            anim.springBounciness = 10
            anim.toValue = btn.center.y - 500
            anim.springSpeed = 8
            anim.beginTime = btn.layer.convertTime(CACurrentMediaTime(), fromLayer: nil) + 0.01*Double(topButtons.indexOf(btn)!)
            btn.tag = topButtons.indexOf(btn)!
            btn.pop_addAnimation(anim, forKey: "anim1")
            btn.tappedBlock = tappedBlock
            //btn.addTarget(self, action: "dismissButtons", forControlEvents: .TouchUpInside)
        }
        
        for btn in bottomButtons
        {
            let anim = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
            anim.fromValue = btn.center.y
            anim.springBounciness = 7
            anim.springSpeed = 8
            btn.tag = bottomButtons.indexOf(btn)!+3
            btn.tappedBlock = tappedBlock
            anim.beginTime = btn.layer.convertTime(CACurrentMediaTime(), fromLayer: nil) + 0.01*Double(bottomButtons.indexOf(btn)!)
            anim.toValue = btn.center.y - 500
            anim.beginTime = CACurrentMediaTime() + 0.1
            btn.pop_addAnimation(anim, forKey: "anim2")
        }

    }
    
    func dismissButtons()
    {
        for btn in topButtons
        {
            let anim = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
            anim.fromValue = btn.center.y
            anim.springBounciness = 12
            anim.toValue = btn.center.y - 500
            anim.beginTime = btn.layer.convertTime(CACurrentMediaTime(), fromLayer: nil) + 0.01*Double(topButtons.indexOf(btn)!)
            btn.pop_addAnimation(anim, forKey: "anim1")
        }
        
        for btn in bottomButtons
        {
            let anim = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
            anim.fromValue = btn.center.y
            anim.springBounciness = 12
            anim.beginTime = btn.layer.convertTime(CACurrentMediaTime(), fromLayer: nil) + 0.01*Double(bottomButtons.indexOf(btn)!)
            anim.toValue = btn.center.y - 500
            if bottomButtons.indexOf(btn) == 2
            {
                anim.completionBlock = {(anim,finished) in
                    self .removeFromSuperview()
                }
            }
            btn.pop_addAnimation(anim, forKey: "anim2")
        }

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //showButtons()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
