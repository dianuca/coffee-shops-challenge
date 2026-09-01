//
//  Coordinate.swift
//  coffee-shops-challenge
//
//  Created by Diana Ciodolan on 01/09/2026.
//

import Foundation

struct Coordinate {
    let x: Double
    let y: Double
    
    //distanta euclidiana
    func distace(to other: Coordinate) -> Double{
        let deltaX = other.x - x
        let deltaY = other.y - y
        return sqrt(deltaX * deltaX + deltaY * deltaY)
    }
}
