# Coffee Shops Challenge

A simple Swift command-line application that finds the three closest coffee shops to a given location.

## Requirements

- Swift 6.3
- macOS 12 or newer

## Input

The program receives three command-line arguments:

```text
<x coordinate> <y coordinate> <csv url>
```

The coffee shop data is downloaded from the URL provided as the third argument.

Each row in the CSV file must have the following format:

```text
Name,Y Coordinate,X Coordinate
```

Example:

```text
Cafe One,45.7900,24.1500
Cafe Two,45.7950,24.1550
Cafe Three,45.8000,24.1600
Cafe Four,45.8100,24.1700
```

## How to Run

Open a terminal in the project folder and run:

```bash
swift run coffee-shops-challenge <x> <y> <csv_url>
```

Example:

```bash
swift run coffee-shops-challenge 24.15 45.79 http://localhost:8000/test-coffee.csv
```

## Output

The program calculates the distance between the user's location and every coffee shop.

The three closest coffee shops are printed from closest to farthest.

Example:

```text
Cafe One,0.0000
Cafe Two,0.0071
Cafe Three,0.0141
```

Distances are displayed with four decimal places.

## Distance Calculation

The program uses Euclidean distance because all coordinates are considered to lie on a plane.

The distance between two coordinates is calculated using:

```text
distance = sqrt((x2 - x1)^2 + (y2 - y1)^2)
```

## Error Handling

The program exits with an error message when:

- the required command-line arguments are missing
- X or Y is not a valid number
- the URL is invalid
- the CSV file cannot be downloaded
- the CSV data is malformed
- fewer than three valid coffee shops are available

## Tests

The project contains tests for:

- distance calculation
- CSV parsing
- invalid CSV data

Run the tests with:

```bash
swift test
```

## Build

To build the project, run:

```bash
swift build
```
