
import SwiftUI


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

