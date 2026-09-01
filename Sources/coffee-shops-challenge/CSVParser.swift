//
//  CSVParser.swift
//  coffee-shops-challenge
//
//  Created by Diana Ciodolan on 01/09/2026.
//

import Foundation

func parseCoffeeShops(from csv: String) -> [CoffeeShop]{
    var coffeeShops: [CoffeeShop] = []
    let lines = csv.components(separatedBy: .newlines)
    for line in lines{
        if line.isEmpty{
            continue
        }
        let values = line.components(separatedBy: ",")
        if values.count != 3{
            continue
        }
        let name = values[0].trimmingCharacters(in: .whitespaces)
        guard let y = Double(values[1].trimmingCharacters(in: .whitespaces)),
              let x = Double(values[2].trimmingCharacters(in: .whitespaces)) else {
            continue
        }
        let coordinate = Coordinate(x: x, y: y)
        let coffeeShop = CoffeeShop(name: name, coordinate: coordinate)
        coffeeShops.append(coffeeShop)
    }
    return coffeeShops
}
