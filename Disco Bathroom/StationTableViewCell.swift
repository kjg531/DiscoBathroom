//
//  StationTableViewCell.swift
//  Disco Bathroom
//
//  Created by KG on 4/9/16.
//  Copyright © 2016 Kenneth Gabbara. All rights reserved.
//


import UIKit

class StationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationDescLabel: UILabel!
    @IBOutlet weak var stationImageView: UIImageView!
    
    var downloadTask: NSURLSessionDownloadTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // set table selection color
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 78/255, green: 82/255, blue: 93/255, alpha: 0.6)
        selectedBackgroundView  = selectedView
    }
    
    func configureStationCell(station: RadioStation) {
        
        // Configure the cell...
        stationNameLabel.text = station.stationName
        stationDescLabel.text = station.stationDesc
        
        let imageURL = station.stationImageURL as NSString
        
        if imageURL.containsString("http") {
            
            if let url = NSURL(string: station.stationImageURL) {
                downloadTask = stationImageView.loadImageWithURL(url) { (image) in
                    // station image loaded
                }
            }
            
        } else if imageURL != "" {
            stationImageView.image = UIImage(named: imageURL as String)
            
        } else {
            stationImageView.image = UIImage(named: "stationImage")
        }
        
        stationImageView.applyShadow()
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        downloadTask?.cancel()
        downloadTask = nil
        stationNameLabel.text  = nil
        stationDescLabel.text  = nil
        stationImageView.image = nil
    }
}
