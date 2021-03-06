//
//  InfoDetailViewController.swift
//  Disco Bathroom
//
//  Created by KG on 4/9/16.
//  Copyright © 2016 Kenneth Gabbara. All rights reserved.
//

import UIKit

class InfoDetailViewController: UIViewController {
    
    @IBOutlet weak var stationImageView: UIImageView!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationDescLabel: UILabel!
    @IBOutlet weak var stationLongDescTextView: UITextView!
    @IBOutlet weak var okayButton: UIButton!
    
    var currentStation: RadioStation!
    var downloadTask: NSURLSessionDownloadTask?

    //*****************************************************************
    // MARK: - ViewDidLoad
    //*****************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStationText()
        setupStationLogo()
    }

    deinit {
        // Be a good citizen.
        downloadTask?.cancel()
        downloadTask = nil
    }
    
    //*****************************************************************
    // MARK: - UI Helpers
    //*****************************************************************
    
    func setupStationText() {
        
        // Display Station Name & Short Desc
        stationNameLabel.text = currentStation.stationName
        stationDescLabel.text = currentStation.stationDesc
        
        // Display Station Long Desc
        if currentStation.stationLongDesc == "" {
            loadDefaultText()
        } else {
            stationLongDescTextView.text = currentStation.stationLongDesc
        }
    }
    
    func loadDefaultText() {
        // Add your own default ext
        stationLongDescTextView.text = "You are listening to Disco Bathroom, this is a sweet open source project. Tell your friends!"
    }
    
    func setupStationLogo() {
        
        // Display Station Image/Logo
        let imageURL = currentStation.stationImageURL
        
        if imageURL.rangeOfString("http") != nil {
            // Get station image from the web, iOS should cache the image
            if let url = NSURL(string: currentStation.stationImageURL) {
                downloadTask = stationImageView.loadImageWithURL(url) { _ in }
            }
            
        } else if imageURL != "" {
            // Get local station image
            stationImageView.image = UIImage(named: imageURL)
            
        } else {
            // Use default image if station image not found
            stationImageView.image = UIImage(named: "stationImage")
        }
        
        // Apply shadow to Station Image
        stationImageView.applyShadow()
    }
    
    //*****************************************************************
    // MARK: - IBActions
    //*****************************************************************
    
    @IBAction func okayButtonPressed(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}
