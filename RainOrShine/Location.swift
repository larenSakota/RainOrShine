//
//  Location.swift
//  RainOrShine
//
//  Created by Laren Sakota on 4/11/17.
//  Copyright © 2017 3..2..1..GO. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() { }
    
    var latitude: Double!
    var longitude: Double!
}
