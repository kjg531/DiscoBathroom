//
//  ViewController.swift
//  Disco Bathroom
//
//  Created by KG on 4/9/16.
//  Copyright © 2016 Kenneth Gabbara. All rights reserved.
//

import UIKit

protocol LightsViewControllerDelegate: class {
    func lightsViewControllerDidUpdateState(withFlashOption flashOption: Bool, lightsOptions: Bool)
}


class LightsViewController: UIViewController, OptionsViewControllerDelegate {
    
    var colorTimer: CancelableTimer?
    
    var i = 0
    
    var lightsOptionIsOn = true
    var flashOptionIsOn = true
    
    typealias Color = UIColor
    let red: Color = UIColor.redColor()
    let blue: Color = UIColor.blueColor()
    let green: Color = UIColor.greenColor()
    let orange: Color = UIColor.orangeColor()
    let yellow: Color = UIColor.yellowColor()
    let cyan: Color = UIColor.cyanColor()
    let magenta: Color = UIColor.magentaColor()
    let purple: Color = UIColor.purpleColor()
    let white: Color = UIColor.whiteColor()
    
    var colors = [Color]()
    
    weak var flashDelegate: LightsViewControllerDelegate?
    
    @IBOutlet weak var playButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colors = [red, blue, green, orange, yellow, cyan, magenta, purple, white]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Disco Bathroom"
        updateState()
    }
    
    
    deinit {
        colorTimer?.cancel()
        colorTimer = nil
    }

    
    func flashColor() {
        if let vcView = self.view{
            let viewSize: CGRect = CGRect(x:0.0,y:0.0,width:vcView.bounds.size.width,height:vcView.bounds.size.height - 50.0)
            let v = UIView(frame: viewSize)
            
            v.backgroundColor = colors[i]
            v.alpha = 1
            
            if i < (colors.count - 1) {
                i += 1
            } else {
                i = 0
            }
            
            vcView.addSubview(v)
            UIView.animateWithDuration(1, animations: {
                v.alpha = 0.0
            }, completion: { [weak self] (finished:Bool) in
                
                guard let validSelf = self else { return }
                
                print(validSelf.i)
                v.removeFromSuperview()
            })
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toLightOptions" {
            let lightOptionsViewController = segue.destinationViewController as! OptionsViewController
            lightOptionsViewController.optionsDelegate = self
            lightOptionsViewController.flashOptionIsOn = flashOptionIsOn
        }
    }
    
    
    func optionsViewControllerDidSwitchStrobeOption(option: Bool) {
        flashOptionIsOn = option
        updateState()
    }
    

    @IBAction func butonACTION(sender: AnyObject) {
        lightsOptionIsOn = !lightsOptionIsOn
        updateState()
    }
    
    
    private func updateState() {
        
        if let validFlashDelegate = flashDelegate {
            validFlashDelegate.lightsViewControllerDidUpdateState(withFlashOption: flashOptionIsOn, lightsOptions: lightsOptionIsOn)
        }
        
        if lightsOptionIsOn {
            if colorTimer == nil {
                colorTimer = CancelableTimer(once: false) { [unowned self] in
                    dispatch_async(dispatch_get_main_queue()) {
                        self.flashColor()
                    }
                }
                colorTimer?.startWithInterval(0.1)
            }
            
            playButton.setImage(UIImage(named: "btn-pause.png"), forState: UIControlState.Normal)
        }
        else {
            colorTimer?.cancel()
            colorTimer = nil
            
            playButton.setImage(UIImage(named: "btn-play.png"), forState: UIControlState.Normal)
            
            i = 0
        }
    }
}
