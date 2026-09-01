//
//  Coordinate.swift
//  coffee-shops-challenge
//
//  Created by Diana Ciodolan on 01/09/2026.
//

import Foundation

//represents a point using X and Y coordinates
struct Coordinate {
    let x: Double
    let y: Double
    // calculates the euclidean distance between two points
    func distance(to other: Coordinate) -> Double{
        let deltaX = other.x - x
        let deltaY = other.y - y
        return sqrt(deltaX * deltaX + deltaY * deltaY)
    }
}
