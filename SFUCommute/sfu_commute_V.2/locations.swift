//
//  locations.swift
//  sfu_commute_V.2
//
//  Created by Tianxiong He on 2016-11-10.
//  Copyright © 2016 Lightspeed-Tech. All rights reserved.
//

import Foundation
import CoreLocation

// make the set Hashable
extension location: Hashable, Equatable {
    var hashValue: Int { return id.hashValue ^ name.hashValue }
}

func ==(lhs: location, rhs: location) -> Bool {
    return lhs.id == rhs.id && lhs.name == rhs.name
}

enum zones : String{
    case A = "A"
    case B = "B"
    case C = "C"
    case D = "D"
    case E = "SFU"
}

struct location {
    var id : Int
    var lat : CLLocationDegrees
    var lon : CLLocationDegrees
    var name : String
    var zone : zones
    var price : Decimal
}

let preDeterminedLocations : [location] = [
    location(id: 0, lat: 49.281019, lon: -123.0031033, name: "Hastings - Willingdon", zone: .A, price: 2.0),
    location(id: 1, lat: 49.2756237, lon: -123.0032437, name: "Parker - Willingdon", zone: .A, price: 2.0),
    location(id: 2, lat: 49.2664946, lon: -123.0031278, name: "Brentwood Skytrain Station", zone: .A, price: 2.0),
    location(id: 3, lat: 49.275542, lon: -122.992168, name: "Parker - Delta", zone: .A, price: 2.0),
    location(id: 4, lat: 49.2803453, lon: -122.9809395, name: "Hastings - Holdom", zone: .A, price: 2.0),
    location(id: 5, lat: 49.2755029, lon: -122.980982, name: "Curtis - Holdom", zone: .A, price: 2.0),
    location(id: 6, lat: 49.264821, lon: -122.981469, name: "Holdom Skytrain Station", zone: .A, price: 2.0),
    
    location(id: 7, lat: 49.2802981, lon: -122.9700205, name: "Hastings - Kensington", zone: .B, price: 1.0),
    location(id: 8, lat: 49.2752175, lon: -122.9700789, name: "Curtis - Kensington", zone: .B, price: 1.0),
    location(id: 9, lat: 49.267986, lon: -122.970104, name: "Halifax - Kensington", zone: .B, price: 1.0),
    location(id: 10, lat: 49.2626492, lon: -122.9701872, name: "Broadway - Kensington", zone: .B, price: 1.0),
    location(id: 11, lat: 49.2803565, lon: -122.9646664, name: "Hastings - Sperling", zone: .B, price: 1.0),
    location(id: 12, lat: 49.2752134, lon: -122.9646611, name: "Curtis - Sperling", zone: .B, price: 1.0),
    location(id: 13, lat: 49.2679789, lon: -122.964592, name: "Halifax - Sperling", zone: .B, price: 1.0),
    location(id: 14, lat: 49.261584, lon: -122.964627, name: "Broadway - Sperling", zone: .B, price: 1.0),
    location(id: 15, lat: 49.259286, lon: -122.964581, name: "Sperling Skytrain Station", zone: .B, price: 1.0),
    location(id: 16, lat: 49.2803255, lon: -122.9533672, name: "Hastings - Duthie", zone: .B, price: 1.0),
    location(id: 17, lat: 49.2752049, lon: -122.9534524, name: "Curtis - Duthie", zone: .B, price: 1.0),
    location(id: 18, lat: 49.27158, lon: -122.953496, name: "Greystone - Duthie", zone: .B, price: 1.0),
    location(id: 19, lat: 49.2679797, lon: -122.9533713, name: "Halifax - Duthie", zone: .B, price: 1.0),
    location(id: 20, lat: 49.2610712, lon: -122.9534171, name: "Broadway - Duthie", zone: .B, price: 1.0),
    location(id: 21, lat: 49.258827, lon: -122.956034, name: "Lougheed - Bainbridge", zone: .B, price: 1.0),
    location(id: 22, lat: 49.270336, lon: -122.945239, name: "Greystone - Burnwood", zone: .B, price: 1.0),
    location(id: 23, lat: 49.2543096, lon: -122.9395122, name: "Lake City Skytrain", zone: .B, price: 1.0),
    
    location(id: 24, lat: 49.264624, lon: -122.927529, name: "Forest Grove - Underhill", zone: .C, price: 1.0),
    location(id: 25, lat: 49.260325, lon: -122.929978, name: "Broadway - Underhill", zone: .C, price: 1.0),
    location(id: 26, lat: 49.257797, lon: -122.927687, name: "Eastlake - Underhill", zone: .C, price: 1.0),
    location(id: 27, lat: 49.263967, lon: -122.914201, name: "Forest Grove - Ash Grove", zone: .C, price: 1.0),
    location(id: 28, lat: 49.253458, lon: -122.918894, name: "Production Skytrain Station", zone: .C, price: 1.0),
    location(id: 29, lat: 49.260005, lon: -122.908624, name: "Gaglardi - Broadway", zone: .C, price: 1.0),
    
    location(id: 30, lat: 49.249043, lon: -122.8949437, name: "North - Austin", zone: .D, price: 2.0),
    location(id: 31, lat: 49.2485016, lon: -122.8991797, name: "Lougheed Skytrain Station", zone: .D, price: 2.0),
    location(id: 32, lat: 49.2534406, lon: -122.8950628, name: "North - Cameron", zone: .D, price: 2.0),
    location(id: 33, lat: 49.256794,  lon: -122.892985, name: "North - Foster", zone: .D, price: 2.0),
    location(id: 34, lat: 49.261409, lon: -122.889836, name: "Burquitlam Skytrain Station", zone: .D, price: 2.0),
    location(id: 35, lat: 49.269096, lon:  -122.880559, name: "Robinson - Clarke", zone: .D, price: 2.0),
    location(id: 36, lat: 49.263622, lon:   -122.880018, name: "Robinson - Como Lake", zone: .D, price: 2.0),
    location(id: 37, lat: 49.2566172, lon: -122.8820331, name: "Robinson - Foster", zone: .D, price: 2.0),
    location(id: 38, lat: 49.2635061, lon: -122.8709511, name: "Blue Mountain - Como Lake", zone: .D, price: 2.0),
    location(id: 39, lat: 49.256282, lon: -122.868944, name: "Blue Mountain - Foster", zone: .D, price: 2.0),
    location(id: 40, lat: 49.249013, lon:  -122.869163, name: "Blue Mountain - Austin", zone: .D, price: 2.0),
    location(id: 41, lat: 49.263528, lon: -122.863168, name: "Porter - Como Lake", zone: .D, price: 2.0),
    location(id: 42, lat: 49.256218, lon:  -122.863349, name: "Porter - Foster", zone: .D, price: 2.0),
    location(id: 43, lat: 49.263490, lon: -122.857595, name: "Gatensbury - Como Lake", zone: .D, price: 2.0),
    location(id: 44, lat: 49.256155, lon:  -122.857820, name: "Gatensbury - Foster", zone: .D, price: 2.0),
    location(id: 45, lat: 49.248966, lon:  -122.857983, name: "Gatensbury - Austin", zone: .D, price: 2.0),
    
    location(id: 46, lat: 49.278945, lon: -122.920482, name: "SFU Main Security Office Intersection", zone: .E, price: 1.0),
    location(id: 47, lat: 49.281164, lon: -122.928258, name: "University - West Campus", zone: .E, price: 1.0),
    location(id: 48, lat: 49.280795, lon: -122.916764, name: "Diamond Alumni Centre", zone: .E, price: 1.0),
    location(id: 49, lat: 49.277490, lon: -122.912706, name: "Lot B", zone: .E, price: 1.0),
    location(id: 50, lat: 49.276775, lon: -122.905371, name: "University High - University Crescent", zone: .E, price: 1.0),
    location(id: 51, lat: 49.275999, lon: -122.914685, name: "South Campus - Science", zone: .E, price: 1.0),
    location(id: 52, lat: 49.273984, lon: -122.912049, name: "Entrance to FIC", zone: .E, price: 1.0),
    location(id: 53, lat: 49.249682, lon: -122.948763, name: "Winston - Phillips", zone: .C, price: 1.0),
]
