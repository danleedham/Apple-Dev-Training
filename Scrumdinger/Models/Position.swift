//
//  Position.swift
//  Scrumdinger
//
//  Created by Dan Leedham on 11/12/2022.
//

import Foundation

struct Position {
    let position: DD
    
    enum LatitudeCardinal: Int {
        case north = 1
        case south = -1
    }
    
    enum LongitudeCardinal: Int {
        case east = 1
        case west = -1
    }
    
    struct DD {
        var lat: Double
        var lon: Double
    }
    
    struct DDM {
        var latCardinal: LatitudeCardinal
        var lonCardinal: LongitudeCardinal
        var latDegree: Int
        var lonDegree: Int
        var latMinute: Double
        var lonMinute: Double
    }
    
    init(fromDDM positionDDM: DDM) {
        self.position = DD(lat: Double(positionDDM.latCardinal.rawValue) * (Double(positionDDM.latDegree) + positionDDM.latMinute/60),  lon:Double(positionDDM.lonCardinal.rawValue) * (Double(positionDDM.lonDegree) + positionDDM.lonMinute/60))
    }
    
    init(_ positionDD: DD) {
        self.position = positionDD
    }
    
    var readableDD: String {
        var output = String(position.lat)
        output += " "
        output += String(position.lon)
        return output
    }
}


let dropzoneInput = Position.DDM(latCardinal: .north, lonCardinal: .east, latDegree: 52, lonDegree: 3, latMinute: 10.45, lonMinute: 3.56)

let dropzoneExample = Position(fromDDM: dropzoneInput)

