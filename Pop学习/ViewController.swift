//
//  ViewController.swift
//  Pop学习
//
//  Created by randy on 16/3/3.
//  Copyright © 2016年 randy. All rights reserved.
//

import UIKit
import pop
class ViewController: UIViewController {
    @IBOutlet weak var square:UIView!
    @IBOutlet weak var square1: UIView!
    var menu:PopMenuView?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {

    }
    
    @IBAction func show(sender: AnyObject)
    {
        menu = PopMenuView(frame: self.view.frame)
        menu!.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(menu!)
        menu?.showButtons({(index) in
            print(index)
            self.menu?.dismissButtons()
        })
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

//        let anim1 = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
//        anim1.fromValue = square.center.y
//        anim1.springBounciness = 12
//        anim1.toValue = square.center.y - 300
//        square.pop_addAnimation(anim1, forKey: "")
//        let anim2 = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
//        anim2.fromValue = square.center.y
//        anim2.springBounciness = 12
//        anim2.toValue = square.center.y - 300
//        anim2.beginTime = CACurrentMediaTime() + 0.1
//        square1.pop_addAnimation(anim2, forKey: "")

    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
//        let view = anim.valueForKey("sq") as? UIView
//        let view1 = anim.valueForKey("sq1") as? UIView
//        view?.center.y -= 300
//        view1?.center.y -= 300
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

