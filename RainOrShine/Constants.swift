//
//  Constants.swift
//  RainOrShine
//
//  Created by Laren Sakota on 3/27/17.
//  Copyright © 2017 3..2..1..GO. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let ID = "id="
let APP_ID = "&appid="
let API_KEY = "41ef4a86a422b6c729776d047d2af599"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(ID)5391959\(APP_ID)\(API_KEY)"

