//
//  OptionsViewController.swift
//  Disco Bathroom
//
//  Created by KG on 4/9/16.
//  Copyright © 2016 Kenneth Gabbara. All rights reserved.
//

import UIKit

protocol OptionsViewControllerDelegate: class {
    func optionsViewControllerDidSwitchStrobeOption(strobeOption: Bool)
}


class OptionsViewController: UIViewController {
    
    @IBOutlet weak var slSwitch: UISwitch!
    @IBOutlet weak var optionsPopupView: UIView!
    @IBOutlet weak var backgroundView: UIImageView!
    
    weak var optionsDelegate: OptionsViewControllerDelegate?
    var flashOptionIsOn: Bool = false {
        didSet {
            guard let validSwitch = slSwitch else { return }
            validSwitch.setOn(flashOptionIsOn, animated: true)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .Custom
    }
    
    
    //*****************************************************************
    // MARK: - ViewDidLoad
    //*****************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Round corners
        optionsPopupView.layer.cornerRadius = 10
        
        // Set background color to clear
        view.backgroundColor = UIColor.clearColor()
        
        // Add gesture recognizer to dismiss view when touched
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(OptionsViewController.closeButtonPressed))
        backgroundView.userInteractionEnabled = true
        backgroundView.addGestureRecognizer(gestureRecognizer)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        slSwitch.setOn(flashOptionIsOn, animated: true)
    }
    
    //*****************************************************************
    // MARK: - IBActions
    //*****************************************************************
    
    @IBAction func closeButtonPressed() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func strobeLightSwitchACTION(sender: AnyObject) {
        
        if let validOptionsDelegate = optionsDelegate {
            validOptionsDelegate.optionsViewControllerDidSwitchStrobeOption(slSwitch.on)
        }
    }
}
