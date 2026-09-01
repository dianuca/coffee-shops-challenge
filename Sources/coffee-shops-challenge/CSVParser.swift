//
//  CSVParser.swift
//  coffee-shops-challenge
//
//  Created by Diana Ciodolan on 01/09/2026.
//

import Foundation

//converts the csv into an array of CoffeeShop objects
func parseCoffeeShops(from csv: String) -> [CoffeeShop]? {
    var coffeeShops: [CoffeeShop] = []
    
    //split the csv content into individual lines
    let lines = csv.components(separatedBy: .newlines)
    for line in lines{
        if line.isEmpty{ //ignore empty lines
            continue
        }
        //split each line using the comma separator
        let values = line.components(separatedBy: ",")
        //each line must contain a name and two coordinates
        guard values.count == 3 else{
            return nil
        }
        //read and clean the coffee shop name
        let name = values[0].trimmingCharacters(in: .whitespaces)
        //convert the coordinate values from String to Double
        guard !name.isEmpty,
              let x = Double(values[1].trimmingCharacters(in: .whitespaces)),
              let y = Double(values[2].trimmingCharacters(in: .whitespaces)) else {
            return nil
        }
        //create the coordinates and coffee shop objects
        let coordinate = Coordinate(x: x, y: y)
        let coffeeShop = CoffeeShop(name: name, coordinate: coordinate)
        coffeeShops.append(coffeeShop) //add the coffee shop to the result 
    }
    return coffeeShops
}
