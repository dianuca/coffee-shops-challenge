import Foundation

@main
struct CoffeeShopsChallenge {

    static func main() async {
        let arguments = CommandLine.arguments //read the command line arguments
        //the program expects 3 arguments: x, y, csv url
        guard arguments.count == 4 else {
            print("Usage: coffee-shops-challenge <x> <y> <csv_url>")
            exit(EXIT_FAILURE)
        }
        //convert the first two argument into double values
        guard let x = Double(arguments[1]),
              let y = Double(arguments[2]) else {
            print("Error: X and Y must be valid numbers.")
            exit(EXIT_FAILURE)
        }
        let userCoordinate = Coordinate(x: x, y: y) //create the user's coordinate
        //convert the third argument into a valid URL
        guard let url = URL(string: arguments[3]) else {
            print("Error: Invalid URL.")
            exit(EXIT_FAILURE)
        }
        do {
            //download the csv file from the url
            let (data, _) = try await URLSession.shared.data(from: url)
            //convert the downloaded data into a stirng
            guard let csv = String(data: data, encoding: .utf8) else {
                print("Error: Unable to read CSV data.")
                exit(EXIT_FAILURE)
            }
            //parse the csv content into CoffeeShop objects
            guard let coffeeShops = parseCoffeeShops(from: csv) else {
                print("Error: Invalid CSV data.")
                exit(EXIT_FAILURE)
            }
            //we need 3 coffee shops to display
            guard coffeeShops.count >= 3 else {
                print("Error: Not enough coffee shops.")
                exit(EXIT_FAILURE)
            }
            //store each coffee shop together with its distance form the user's location
            var shopsWithDistance: [(shop: CoffeeShop, distance: Double)] = []
            for shop in coffeeShops {
                //calculate the distance between the user and the coffee shop
                let distance = userCoordinate.distance(to: shop.coordinate)
                shopsWithDistance.append((shop, distance))
            }
            //sort the coffee shops from the closest to the farthest
            shopsWithDistance.sort{
                $0.distance < $1.distance
            }
            //tahe only the first 3 coffee shops
            let closestShops = shopsWithDistance.prefix(3)
            //print the name and distance of each one
            for item in closestShops {
                //format the distance to exactly 4 decimal
                let distance = String(
                    format: "%.4f",
                    locale: Locale(identifier: "en_US_POSIX"),
                    item.distance
                )
                print("\(item.shop.name),\(distance)")
            }
        } catch {
            //handle errors that may occur while downloading the csv file
            print("Error: Could not download CSV file.")
            exit(EXIT_FAILURE)
        }
    }
}
