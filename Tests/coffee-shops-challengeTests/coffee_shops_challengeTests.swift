import XCTest
@testable import coffee_shops_challenge

final class CoffeeShopsChallengeTests: XCTestCase {

    func testDistance() {
        let first = Coordinate(x: 0, y: 0)
        let second = Coordinate(x: 3, y: 4)
        let distance = first.distance(to: second)
        XCTAssertEqual(distance, 5.0)
    }

    func testCSVParser() {
        let csv = """
        Cafe One,20.0,10.0
        Cafe Two,30.0,15.0
        """
        let coffeeShops = parseCoffeeShops(from: csv)
        XCTAssertEqual(coffeeShops.count, 2)
        XCTAssertEqual(coffeeShops[0].name, "Cafe One")
        XCTAssertEqual(coffeeShops[0].coordinate.x, 10.0)
        XCTAssertEqual(coffeeShops[0].coordinate.y, 20.0)
    }
}
