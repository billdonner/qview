
import SwiftUI


// MatrixView displays a grid of cells and corresponding labels
struct MatrixView: View {
  let rows: Int
  let cols: Int
  let matrix: [[Move?]]
  let reason: String
  let bottomLabel: String
  let correctColor: Color
  let incorrectColor: Color
  @Binding var  isPresented: Bool
  
  var body: some View {
    ZStack {
      WrappedDismissButton(isPresented: $isPresented)
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

struct OnboardingScreen: View {
  @Binding var  isPresented: Bool
  var body: some View {
    TabView {
      OB01(isPresented: $isPresented)
        .tag(mkID())
      OB02(isPresented: $isPresented)
        .tag(mkID())
      OB03(isPresented: $isPresented)
        .tag(mkID())
      OB04(isPresented: $isPresented)
        .tag(mkID())
      OB05(isPresented: $isPresented)
        .tag(mkID())
      OB06(isPresented: $isPresented)
        .tag(mkID())
      OB07(isPresented: $isPresented)
        .tag(mkID())
    }
    .background(Color.red)
    .tabViewStyle(PageTabViewStyle())
  }
}
#Preview {
  OnboardingScreen(isPresented: .constant(true))
}
struct HowToPlayScreen: View {
  @Binding var  isPresented: Bool
  var body: some View {
    TabView {
      FrontMatter()
        .tag(mkID())
      startInAnyCorner(isPresented: $isPresented)
        .tag(mkID())
      move0(isPresented: $isPresented)
        .tag(mkID())
      nonAdjecntMove(isPresented: $isPresented)
        .tag(mkID())
      move1(isPresented: $isPresented)
        .tag(mkID())
      move2(isPresented: $isPresented)
        .tag(mkID())
      MoreFrontMatter()
        .tag(mkID())
      interiorAdjacency(isPresented: $isPresented)
        .tag(mkID())
      borderAdjacency(isPresented: $isPresented)
        .tag(mkID())
      cornerAdjacency(isPresented: $isPresented)
        .tag(mkID())
      Intermission()
        .tag(mkID())
      shortPathToSuccess(isPresented: $isPresented)
        .tag(mkID())
      shortPathToFailure(isPresented: $isPresented)
        .tag(mkID())
      longPathToSuccess(isPresented: $isPresented)
        .tag(mkID())
      notA3x3Winner(isPresented: $isPresented)
        .tag(mkID())
      longPathToFailure(isPresented: $isPresented)
        .tag(mkID())
      allFilledButWinningPath(isPresented: $isPresented)
        .tag(mkID())
      bottomsUp(isPresented: $isPresented)
        .tag(mkID())
      niceWinner(isPresented: $isPresented)
        .tag(mkID())
    }
    .tabViewStyle(PageTabViewStyle())
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
func startOnboarding(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 0, col: 0), move: Move(.correct, text: "checkmark")),
      PDM((row: 0, col: 2), move: Move(.correct, text: "x.circle")),
      PDM((row: 2, col: 0), move: Move(.correct, text: "checkmark")),
      PDM((row: 2, col: 2), move: Move(.correct, text: "checkmark")),
    ]),
    reason: "Onboarding",
    bottomLabel: "Do We Want This Rule?",
    correctColor: .yellow,
    incorrectColor: .blue,
    isPresented: isPresented
  )
}
/**
### Panel 1: Welcome & Objective
- **Title:** Welcome to QANDA Game!
- **Content:** Provide a brief overview of the game and its main objective.
  - "Welcome to QANDA! In this game, you'll answer trivia questions to connect two diagonal corners on a grid. Answer questions correctly to complete a path from one corner to its opposite corner."
*/
 struct OB01: View {
   @Binding var isPresented:Bool
   var body: some View {
     ZStack {
       WrappedDismissButton(isPresented: $isPresented)
       VStack {
         Image("Onboarding1")
           .resizable()
           .scaledToFit()
           .padding()
         Text("Welcome to QANDA Game!")
           .font(.title)
           .padding()
         Text("Welcome to QANDA! In this game, you'll answer trivia questions to connect two diagonal corners on a grid. Answer questions correctly to complete a path from one corner to its opposite corner.")
           .padding()
       }
     }
   }
}
#Preview {
  OB01(isPresented: .constant(true))
}
 /**
### Panel 2: Game Board & Topics
- **Title:** Game Board & Topics
- **Content:** Explain the game board layout and how topics are organized and color-coded.
  - "Each game board is a grid of cells with questions inside. Each cell is color-coded by topic. Choose and answer questions in any order, but you must create a continuous path of correct answers from corner to corner!"
  */

struct OB02: View {
  @Binding var isPresented:Bool
  var body: some View {
    ZStack {
      WrappedDismissButton(isPresented: $isPresented)
      VStack {
        Image("Onboarding2")
          .resizable()
          .scaledToFit()
          .padding()
        Text("Game Board & Topics")
          .font(.title)
          .padding()
        Text("Each game board is a grid of cells with questions inside. Each cell is color-coded by topic. Choose and answer questions in any order, but you must create a continuous path of correct answers from corner to corner!")
          .padding()
      }
    }
  }
}


/*
  ### Panel 3: Selecting Topics
- **Title:** Selecting Topics
- **Content:** Explain the topic screen how topics are organized and color-coded.
  - "You can choose some topics, but we will choose the others. If you dont like our choices, you can re-roll them once!  We'll pick the colors or you can choose your own"
 */

struct OB03: View {
  @Binding var isPresented:Bool
  var body: some View {
    ZStack {
      WrappedDismissButton(isPresented: $isPresented)
      VStack {
        Image("Onboarding3")
          .resizable()
          .scaledToFit()
          .padding()
        Text("Selecting Topics")
          .font(.title)
          .padding()
        Text("You can choose some topics, but we will choose the others. If you dont like our choices, you can re-roll them once!  We'll pick the colors or you can choose your own")
          .padding()
      }
    }
  }
}

/*

### Panel 4: Answering Questions
- **Title:** Answering Questions
- **Content:** Describe the multiple-choice questions and how to interact with them.
  - "Tap any cell to see a multiple-choice question. Answer correctly to earn a point and mark the cell as correct. Incorrect answers mark the cell as incorrect. You can only move to adjacent cells next."
*/

struct OB04: View {
  @Binding var isPresented:Bool
  var body: some View {
    ZStack {
      WrappedDismissButton(isPresented: $isPresented)
      VStack {
        Image("Onboarding4")
          .resizable()
          .scaledToFit()
          .padding()
        Text("Answering Questions")
          .font(.title)
          .padding()
        Text("Tap any cell to see a multiple-choice question. Answer correctly to earn a point and mark the cell as correct. Incorrect answers mark the cell as incorrect. You can only move to adjacent cells next.")
          .padding()
      }
    }
  }
}
/*
### Panel 5: Using Gimmees
- **Title:** Using Gimmees
- **Content:** Explain the concept of gimmees and how players can use them.
  - "You start each game with a few gimmees, which let you replace a question. Long-press an unplayed cell to use a gimmee. If you get stuck, gimmees can save the day!"
*/
struct OB05: View {
  @Binding var isPresented:Bool
  var body: some View {
    ZStack {
      WrappedDismissButton(isPresented: $isPresented)
      VStack {
        Image("Onboarding5")
          .resizable()
          .scaledToFit()
          .padding()
        Text("Using Gimmees")
          .font(.title)
          .padding()
        Text("You start each game with a few gimmees, which let you replace a question. Long-press an unplayed cell to use a gimmee. If you get stuck, gimmees can save the day!")
          .padding()
      }
    }
  }
}
/*
### Panel 6: Winning & Losing
- **Title:** Winning & Losing
- **Content:** Outline the win and lose conditions.
  - "To win, complete a path of correct answers from one corner to the opposite diagonal corner. The game is over if there's no possible winning path and you have no gimmees left."
*/
struct OB06: View {
  @Binding var isPresented:Bool
  var body: some View {
    ZStack {
      WrappedDismissButton(isPresented: $isPresented)
      VStack {
        Image("Onboarding6")
          .resizable()
          .scaledToFit()
          .padding()
        Text("Winning & Losing")
          .font(.title)
          .padding()
        Text("To win, complete a path of correct answers from one corner to the opposite diagonal corner. The game is over if there's no possible winning path and you have no gimmees left.")
          .padding()
      }
    }
  }
}
/*
### Panel 7: Difficulty Levels & Game Variants
- **Title:** Difficulty & Variants
- **Content:** Briefly describe the difficulty settings and game variants.
  - "Choose your difficulty level: easy, normal, or hard. Experiment with different game variants like 'All Questions Face Up' or 'All Questions Face Down' for extra challenges. Good luck!"
*/
struct OB07: View {
    @Binding var isPresented:Bool
    var body: some View {
      ZStack {
        WrappedDismissButton(isPresented: $isPresented)
        VStack {
          Image("Onboarding7")
            .resizable()
            .scaledToFit()
            .padding()
          Text("Difficulty & Variants")
            .font(.title)
            .padding()
          Text("Choose your difficulty level: easy, normal, or hard. Experiment with different game variants like 'All Questions Face Up' or 'All Questions Face Down' for extra challenges. Good luck!")
            .padding()
        }
      }
    }
  }

struct WrappedDismissButton: View {
  @Binding var isPresented:Bool
  var body: some View {
    VStack {
      HStack { Spacer(); DismissButton(isPresented: $isPresented).padding(.horizontal)}
      Spacer()
    }
  }
}
