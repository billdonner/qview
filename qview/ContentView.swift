/*
 write a small swiftui app which displays an NxM Matrix of colored cells that can be used as the background for QANDA. Make all cells gray. Accept a NxM Matrix of 2 tuples of (move #,outcome) as Input.

 If the cell is correct give it a 3 pixel green border, if its incorrect give it a red border. As each cell is generated place the move number(1 origined) into the cell as text

Here's a small SwiftUI application that displays an NxM matrix of colored cells, accepting a matrix of 2-tuples of (move #, outcome) as input. It's designed to meet your specifications, including displaying the move number and applying borders based on the outcome of each cell:
 
 --''''
 
 
 Let's audit the `generateTestMatrix` function and ensure that the moves are generated such that each subsequent move adheres to the adjacency rule perfectly.

 ### Audit and Corrections

 1. **Matrix Initialization:**
    - A matrix of size NxN is created with all cells initialized to `nil`.

 2. **Starting Position:**
    - The first move is fixed to the top-left cell (0, 0).

 3. **Adjacency Rule:**
    - Moves are only valid if they are to an adjacent cell (diagonally, horizontally, or vertically).
    - Ensure cells are chosen randomly but within valid bounds and previously unoccupied.

 4. **Termination Condition:**
    - If no valid adjacent cell is found, stop generating further moves, leaving the remaining cells blank.


 */
import SwiftUI

// Global opacity
let grayBackgroundOpacity: Double = 0.5

struct MatrixView: View {
    let rows: Int
    let columns: Int
    let matrix: [[Move?]]
    let terminationReason: String

    var body: some View {
        VStack {
            Text("QANDA Game Board \(rows)x\(columns)")
                .font(.headline)
                .padding()

            VStack(spacing: 0) {
                ForEach(0..<rows, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<columns, id: \.self) { column in
                            CellView(move: matrix[row][column])
                        }
                    }
                }
            }
            .padding()

            Text(terminationReason)
                .font(.caption)
                .padding(.top)
        }
    }
}

struct CellView: View {
    var move: Move?

    var body: some View {
        Text(move != nil ? "\(move!.number)" : "")
            .frame(width: 50, height: 50)
            .background(Color.gray.opacity(grayBackgroundOpacity))
            .border(move?.outcome == .correct ? Color.green : Color.red, width: move != nil ? 3 : 0)
    }
}

struct Move {
    let number: Int
    let outcome: Outcome
}

enum Outcome {
    case correct
    case incorrect
}

struct Grid: Identifiable {
    let id = UUID()
    let rows: Int
    let columns: Int
}

@main
struct QANDAApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        PagedScrollView()
    }
}

struct PagedScrollView: View {
    let grids = [
        Grid(rows: 3, columns: 3),
        Grid(rows: 4, columns: 4),
        Grid(rows: 5, columns: 5),
        Grid(rows: 6, columns: 6),
        Grid(rows: 3, columns: 5),
        Grid(rows: 4, columns: 7)
    ]

    var body: some View {
        TabView {
            ForEach(grids) { grid in
                let (matrix, terminationReason) = generateFullTestMatrix(rows: grid.rows, columns: grid.columns)
                MatrixView(rows: grid.rows, columns: grid.columns, matrix: matrix, terminationReason: terminationReason)
                    .tag("\(grid.rows)x\(grid.columns)")
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}


// Retry function to generate a full matrix
func generateFullTestMatrix(rows: Int, columns: Int, maxRetries: Int = 5) -> (matrix: [[Move?]], terminationReason: String) {
    for _ in 0..<maxRetries {
        let result = generateTestMatrix(rows: rows, columns: columns)
        if result.terminationReason == "All moves completed" {
            return result
        }
    }
    
    // If no full matrix is generated after maxRetries, return the last attempt
    return generateTestMatrix(rows: rows, columns: columns)
}

func generateTestMatrix(rows: Int, columns: Int) -> (matrix: [[Move?]], terminationReason: String) {
    // Initialize the matrix with nil values
    var matrix = Array(repeating: Array(repeating: Move?.none, count: columns), count: rows)
    
    // Decide starting position (0,0) or random cell with 50% probability each
    let startIsRandom = Bool.random()
    let startRow = startIsRandom ? Int.random(in: 0..<rows) : 0
    let startColumn = startIsRandom ? Int.random(in: 0..<columns) : 0

    var moveNumber = 1
    var currentPos = (row: startRow, col: startColumn)
    matrix[currentPos.row][currentPos.col] = Move(number: moveNumber, outcome: .correct)
    moveNumber += 1
    
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0), (1, 1), (1, -1), (-1, 1), (-1, -1)]
    var terminationReason = "All moves completed"

    while moveNumber <= rows * columns {
        var foundNextMove = false
        
        let availableDirections = directions.shuffled()
        for dir in availableDirections {
            let newRow = currentPos.row + dir.0
            let newCol = currentPos.col + dir.1
            if newRow >= 0 && newRow < rows && newCol >= 0 && newCol < columns && matrix[newRow][newCol] == nil {
                currentPos = (newRow, newCol)
                matrix[currentPos.row][currentPos.col] = Move(number: moveNumber, outcome: Bool.random() ? .correct : .incorrect)
                moveNumber += 1
                foundNextMove = true
                break
            }
        }
        
        // If no adjacent cells are available, break the loop
        if !foundNextMove {
            terminationReason = "No adjacent moves available"
            break
        }
    }
    
    // Check if all cells are filled
    if matrix.flatMap({ $0 }).contains(where: { $0 == nil }) {
        terminationReason = "No adjacent moves available"
    }
    
    return (matrix, terminationReason)
}
