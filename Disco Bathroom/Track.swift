//
//  Track.swift
//  Disco Bathroom
//
//  Created by KG on 4/9/16.
//  Copyright © 2016 Kenneth Gabbara. All rights reserved.
//

import UIKit

//*****************************************************************
// Track struct
//*****************************************************************

struct Track {
    var title: String = ""
    var artist: String = ""
    var artworkURL: String = ""
    var artworkImage = UIImage(named: "albumArt")
    var artworkLoaded = false
    var isPlaying: Bool = false
}