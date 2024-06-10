
import SwiftUI
struct WrappedDismissButton: View {
  @Binding var isPresented:Bool
  var body: some View {
    VStack {
      HStack { Spacer(); DismissButton(isPresented: $isPresented).padding(.horizontal)}
      Spacer()
    }
  }
}


// MatrixView displays a grid of cells and corresponding labels
struct MatrixView: View {
  let rows: Int
  let cols: Int
  let matrix: [[Move?]]
  let topLabel: String?
  let bottomLabel: String?
  let correctColor: Color
  let incorrectColor: Color
  @Binding var  isPresented: Bool
  
  var body: some View {
    ZStack {
      WrappedDismissButton(isPresented: $isPresented)
      VStack {
        // Top label with reason
        if let topLabel = topLabel { 
          Text("\(topLabel)")
            .font(.title)
            .padding()
        }
        
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
        if let bottomLabel = bottomLabel {
          Text("\(bottomLabel)")
            .font(.body)
            .padding()
        }
      }
    }
  }
}

// Move now includes an optional text property and a useSymbol flag
struct Move {
  internal init(_ outcome: Outcome, text: String? = nil, useSymbol: Bool = true) {

    self.outcome = outcome
    self.text = text ?? ""
    self.useSymbol = useSymbol
  }
  
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
    .frame(width: 64, height: 64)
    .background(Color.black)
    .foregroundColor(.white)
    .border(move?.outcome == .correct ? correctColor :
              (move?.outcome == .incorrect ? incorrectColor : .blue) ,
                   width: move != nil ? 3 : 1)
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
func mkID() -> String {
  return UUID().uuidString
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
  @State private var isShowingPagedScrollView = false
  @State private var isShowingOnboardingView = false
    var body: some View {
      Spacer()
        VStack {
            Button(action: {
                isShowingPagedScrollView.toggle()
            }) {
                Text("How To Play")
            }
        }
        .fullScreenCover(isPresented: $isShowingPagedScrollView) {
            HowToPlayScreen(isPresented: $isShowingPagedScrollView)
        }
      Spacer()
      VStack {
          Button(action: {
              isShowingOnboardingView.toggle()
          }) {
              Text("Onboarding Sequence")
          }
      }
      .fullScreenCover(isPresented: $isShowingOnboardingView) {
          OnboardingScreen(isPresented: $isShowingOnboardingView)
      }
      Spacer()
    }
}
struct DismissButton: View {
    @Environment(\.presentationMode) var presentationMode
  @Binding var  isPresented: Bool
    var body: some View {
        Button(action: {
            isPresented = false
          
        }) {
            Image(systemName: "x.circle")
                .font(.title)
                .foregroundColor(.black)
        }
    }
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

