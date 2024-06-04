/*
 write a small swiftui app which displays an NxM Matrix of colored cells that can be used as the background for QANDA. Make all cells gray. Accept a NxM Matrix of 2 tuples of (move #,outcome) as Input.
 
 If the cell is correct give it a 3 pixel green border, if its incorrect give it a red border. As each cell is generated place the move number(1 origined) into the cell as text
 
 Here's a small SwiftUI application that displays an NxM matrix of colored cells, accepting a matrix of 2-tuples of (move #, outcome) as input. It's designed to meet your specifications, including displaying the move number and applying borders based on the outcome of each cell:
 
 --''''
 
 
 Let's audit the `generateTestMatrix` function and ensure that the moves are generated such that each subsequent move adheres to the adjacency rule perfectly.
 
 ### Audit and Corrections
 
 1. **Matrix Initialization:**
 - A matrix of size NxN is created with all cells initialized to `nil`.
 
 2. **Starting **
 - The first move is fixed to the top-left cell (0, 0).
 
 3. **Adjacency Rule:**
 - Moves are only valid if they are to an adjacent cell (diagonally, horizontally, or vertically).
 - Ensure cells are chosen randomly but within valid bounds and previously unoccupied.
 
 4. **Termination Condition:**
 - If no valid adjacent cell is found, stop generating further moves, leaving the remaining cells blank.
 
 
 */


import SwiftUI

// Global opacity for cells
//let grayBackgroundOpacity: Double = 0.5

// MatrixView displays a grid of cells and corresponding labels
struct MatrixView: View {
  let rows: Int
  let cols: Int
  let matrix: [[Move?]]
  let reason: String
  let bottomLabel: String
  let correctColor: Color
  let incorrectColor: Color
  
  var body: some View {
    VStack {
      // Top label with reason
      Text("\(reason)")
        .font(.title)
        .padding()
      
      // Grid of cells
      VStack(spacing: 0) {
        ForEach(0..<rows, id: \.self) { row in
          HStack(spacing: 0) {
            ForEach(0..<cols, id: \.self) { column in
              CellView(move: matrix[row][column], correctColor: correctColor, incorrectColor: incorrectColor)
            }
          }
        }
      }
      .padding()
      
      // Bottom label
      Text("\(bottomLabel)")
        .font(.body)
        .padding()
    }
  }
}

// Move now includes an optional text property and a useSymbol flag
struct Move {
  internal init(_ number: Int, outcome: Outcome, text: String? = nil, useSymbol: Bool = false) {
    self.number = number
    self.outcome = outcome
    self.text = text ?? "\(number)"
    self.useSymbol = useSymbol
  }
  
  let number: Int
  let outcome: Outcome
  let text: String
  let useSymbol: Bool
}

// CellView represents each cell in the grid with new text or symbol display logic
struct CellView: View {
  var move: Move?
  let correctColor: Color
  let incorrectColor: Color
  
  var body: some View {
    Group {
      if let move = move {
        if move.useSymbol  {
          Image(systemName: move.text)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height:30)
        } else {
          Text(move.text)
        }
      } else {
        Text("")
      }
    }
    .frame(width: 70, height: 70)
    .background(Color.black)
    .foregroundColor(.white)
    .border(move?.outcome == .correct ? correctColor : incorrectColor, width: move != nil ? 3 : 0)
  }
}


// Enum to define outcomes
enum Outcome {
  case correct
  case incorrect
}

// Data structure to hold position and corresponding move
struct PDM {
  internal init(_ p: (Int, Int), move: Move) {
    self.position = p
    self.move = move
  }
  
  let position: (row: Int, col: Int)
  let move: Move
}

// Function to create matrix from predefined moves
func PDMatrix(rows: Int, cols: Int, pdms: [PDM], title: String? = "") -> [[Move?]] {
  // Initialize an empty matrix with nil values
  var matrix: [[Move?]] = Array(repeating: Array(repeating: nil, count: cols), count: rows)
  
  // Place each predefined move into the matrix
  for predefinedMove in pdms {
    let position = predefinedMove.position
    // Ensure position is within bounds
    if position.row < rows && position.col < cols {
      matrix[position.row][position.col] = predefinedMove.move
    }
  }
  
  return matrix
}

// Main application entry point
@main
struct QANDAApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

// ContentView as the root view
struct ContentView: View {
  var body: some View {
    PagedScrollView()
  }
}
struct FrontMatter :View{
  var body: some View {
    ZStack{
      Color.yellow
      Text("How to Play").font(.largeTitle)
    }.ignoresSafeArea()
  }
}
struct MoreFrontMatter :View{
  var body: some View {
    ZStack{
      Color.yellow
      Text("Let's Talk About Adjacency").font(.largeTitle).padding()
    }.ignoresSafeArea()
  }
}
struct Intermission :View{
  var body: some View {
    ZStack{
      Color.yellow
      Text("Some Examples").font(.largeTitle)
    }.ignoresSafeArea()
  }
}
// PagedScrollView for navigation through different examples
struct PagedScrollView: View {
  
  func mkID() -> String {
    return UUID().uuidString
  }
  var body: some View {
    TabView {
      
      FrontMatter()
        .tag(mkID())
      
      startInAnyCorner()
        .tag(mkID())
      move0()
        .tag(mkID())
      
      nonAdjecntMove()
        .tag(mkID())
      
      move1()
        .tag(mkID())
      move2()
        .tag(mkID())
      MoreFrontMatter()
        .tag(mkID())
      
      interiorAdjacency()
        .tag(mkID())
      
      borderAdjacency()
        .tag(mkID())
      
      cornerAdjacency()
        .tag(mkID())
      Intermission()
        .tag(mkID())
      shortPathToSuccess()
        .tag(mkID())
      
      shortPathToFailure()
        .tag(mkID())
      
      longPathToSuccess()
        .tag(mkID())
      
      notA3x3Winner()
        .tag(mkID())
      longPathToFailure()
        .tag(mkID())
      
      
      allFilledButWinningPath()
        .tag(mkID())
      
      sixBySixExample2()
        .tag(mkID())
      
      sixBySixNiceWinner()
        .tag(mkID())
      
    }
    .tabViewStyle(PageTabViewStyle())
  }
}
func notA3x3Winner() -> MatrixView {
  return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
    PDM((row: 0, col: 0), move: Move(1, outcome: .correct)),
    PDM((row: 0, col: 1), move: Move(6, outcome: .incorrect)),
    PDM((row: 0, col: 2), move: Move(3, outcome: .correct)),
    PDM((row: 1, col: 1), move: Move(2, outcome: .incorrect)),
    PDM((row: 1, col: 2), move: Move(4, outcome: . correct)),
    // PDM((row: 2, col: 0), move: Move(4, outcome: .correct)),
    PDM((row: 2, col: 1), move: Move(7, outcome: .incorrect)),
    PDM((row: 2, col: 2), move: Move(5, outcome: . correct)),
  ]), reason: "Tough Loss", bottomLabel: "Not a winner", correctColor: .green, incorrectColor: .red)
}

/*
 
 ### Explanation:
 
 The above Swift code defines a SwiftUI-based app that displays NxM matrices of colored cells used as the background for a QANDA (Question and Answer) game. It includes the following features and components:
 
 1. **Global Constants**: Define the gray background opacity for cells.
 2. **MatrixView**: Displays a grid of cells and corresponding labels, with new parameters for custom colors and a bottom label.
 3. **CellView**: Represents each cell in the grid, now with customizable colors for correct and incorrect moves.
 4. **Move and Outcome**: Data models to represent the moves within the grid.
 5. **PDM and PDMatrix**: Data and functions for converting predefined moves into a matrix.
 6. **PagedScrollView**: Main view using a `TabView` to display multiple pre-defined matrices as pages. Now includes new examples for different paths and customizable colors.
 7. **Main Application**: Starts the app with `PagedScrollView`.
 
 The app provides visual feedback on the correctness of the user's moves by changing the color of the borders around the cells, now customizable to any color.
 
 
 */
#Preview {
  ContentView()
  
}
