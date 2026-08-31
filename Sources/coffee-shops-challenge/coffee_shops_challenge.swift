import Foundation

@main
struct CoffeeShopsChallenge {
    static func main() {
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

        print("X: \(userCoordinate.x)")
        print("Y: \(userCoordinate.y)")
        print("URL: \(url)")
    }
}
