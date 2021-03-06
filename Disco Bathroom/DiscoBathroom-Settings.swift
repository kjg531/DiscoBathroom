//
//  DiscoBathroom-Settings.swift
//  Disco Bathroom
//
//  Created by KG on 4/9/16.
//  Copyright © 2016 Kenneth Gabbara. All rights reserved.
//

import Foundation


//**************************************
// GENERAL SETTINGS
//**************************************

// Display Comments
let DEBUG_LOG = true

//**************************************
// STATION JSON
//**************************************

// If this is set to "true", it will use the JSON file in the app
// Set it to "false" to use the JSON file at the stationDataURL

let useLocalStations = false
let stationDataURL   = "http://kennethgabbara.com/stations.json"

//**************************************
// SEARCH BAR
//**************************************

// Set this to "true" to enable the search bar
let searchable = true

//**************************************
// LASTFM API
//**************************************

// Use LastFM or iTunes API
// set to "false" to use iTunes
let useLastFM = true

// IF YOU USE LASTFM, PLEASE USE YOUR OWN KEY
// Visit: http://www.last.fm/api

let apiKey    = "9a267c245324cfa4f887366d497d3dd3"
let apiSecret = "f1191864d7ae71e580b89238129768b8"

