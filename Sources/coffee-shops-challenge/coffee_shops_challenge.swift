import Foundation

@main
struct CoffeeShopsChallenge {

    static func main() async {
        let arguments = CommandLine.arguments
        guard arguments.count == 4 else {
            print("Usage: coffee-shops-challenge <x> <y> <csv_url>")
            exit(EXIT_FAILURE)
        }
        guard let x = Double(arguments[1]),
              let y = Double(arguments[2]) else {
            print("Error: X and Y must be valid numbers.")
            exit(EXIT_FAILURE)
        }
        let userCoordinate = Coordinate(x: x, y: y)
        guard let url = URL(string: arguments[3]) else {
            print("Error: Invalid URL.")
            exit(EXIT_FAILURE)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            guard let csv = String(data: data, encoding: .utf8) else {
                print("Error: Unable to read CSV data.")
                exit(EXIT_FAILURE)
            }
            let coffeeShops = parseCoffeeShops(from: csv)
            if coffeeShops.isEmpty{
                print("Error: No valid coffee shops found.")
                exit(EXIT_FAILURE)
            }
            var shopsWithDistance: [(shop: CoffeeShop, distance: Double)] = []
            for shop in coffeeShops {
                let distance = userCoordinate.distance(to: shop.coordinate)
                shopsWithDistance.append((shop, distance))
            }
            shopsWithDistance.sort{
                $0.distance < $1.distance
            }
            let closestShops = shopsWithDistance.prefix(3)
            for item in closestShops {
                print("\(item.shop.name), \(String(format: "%.4f", item.distance))")
            }
            
        } catch {
            print("Error: Could not download CSV file.")
            exit(EXIT_FAILURE)
        }
    }
}
