//
//  Ext.swift
//  qview
//
//  Created by bill donner on 6/3/24.
//

import Foundation

 func cornerAdjacency() -> MatrixView {
  return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
    PDM((row: 0, col: 0), move: Move(1, outcome: .incorrect, text: "flag.fill", useSymbol: true)),
    PDM((row: 1, col: 1), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
    PDM((row: 1, col: 0), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
    PDM((row: 0, col: 1), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
  ]), reason: "Corner Adjacency", bottomLabel: "The corner cells have only 3 adjacent cells", correctColor: .yellow, incorrectColor: .blue)
}
 func interiorAdjacency() -> MatrixView {
    return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      
        PDM((row: 1, col: 1), move: Move(1, outcome: .incorrect, text: "flag.fill", useSymbol: true)),
        PDM((row: 0, col: 0), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
        PDM((row: 0, col: 2), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
        PDM((row: 2, col: 0), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
        PDM((row: 1, col: 0), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
        PDM((row: 2, col: 2), move: Move(0, outcome: . correct, text: "checkmark", useSymbol: true)),
        PDM((row: 1, col: 2), move: Move(0, outcome: . correct, text: "checkmark", useSymbol: true)),
        PDM((row: 0, col: 1), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
        PDM((row: 2, col: 1), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true))
    ]), reason: "Interior Adjacency", bottomLabel: "Each interior cell has upto 8 adjacent cells", correctColor: .yellow, incorrectColor: .blue)
}

 func notA3x3Winner() -> MatrixView {
    return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
        PDM((row: 0, col: 0), move: Move(1, outcome: .correct)),
        PDM((row: 1, col: 1), move: Move(2, outcome: .incorrect)),
        PDM((row: 0, col: 2), move: Move(3, outcome: .correct)),
        PDM((row: 2, col: 0), move: Move(4, outcome: .correct)),
        PDM((row: 1, col: 0), move: Move(5, outcome: .incorrect)),
        PDM((row: 2, col: 2), move: Move(6, outcome: . correct)),
        
        PDM((row: 1, col: 2), move: Move(7, outcome: . correct)),
        PDM((row: 0, col: 1), move: Move(8, outcome: .incorrect)),
        PDM((row: 2, col: 1), move: Move(9, outcome: .incorrect))
    ]), reason: "All Filled Loser", bottomLabel: "Not a winner, yet all four corners are green", correctColor: .green, incorrectColor: .red)
}

 func allFilledButWinningPath() -> MatrixView {
    return MatrixView(rows: 4, cols: 4, matrix: PDMatrix(rows: 4, cols: 4, pdms: [
        PDM((row: 0, col: 0), move: Move(1, outcome: .incorrect)),
        PDM((row: 0, col: 1), move: Move(2, outcome: .correct)),
        PDM((row: 0, col: 2), move: Move(3, outcome: .incorrect)),
        PDM((row: 0, col: 3), move: Move(4, outcome: .correct)),
        PDM((row: 1, col: 0), move: Move(5, outcome: .correct)),
        PDM((row: 1, col: 1), move: Move(6, outcome: .incorrect)),
        PDM((row: 1, col: 2), move: Move(7, outcome: .correct)),
        PDM((row: 1, col: 3), move: Move(8, outcome: .incorrect)),
        PDM((row: 2, col: 0), move: Move(9, outcome: .correct)),
        PDM((row: 2, col: 1), move: Move(10, outcome: .incorrect)),
        PDM((row: 2, col: 2), move: Move(11, outcome: .correct)),
        PDM((row: 2, col: 3), move: Move(12, outcome: .incorrect)),
        PDM((row: 3, col: 0), move: Move(13, outcome: .correct)),
        PDM((row: 3, col: 1), move: Move(14, outcome: .incorrect)),
        PDM((row: 3, col: 2), move: Move(15, outcome: .correct)),
        PDM((row: 3, col: 3), move: Move(16, outcome: .incorrect))
    ]), reason: "All Filled But Success", bottomLabel: "All cells filled and winning path", correctColor: .green, incorrectColor: .red)
}


 func longPathToSuccess() -> MatrixView {
    return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
        PDM((row: 0, col: 2), move: Move(1, outcome: .correct)),
        PDM((row: 1, col: 1), move: Move(2, outcome: .incorrect)),
        PDM((row: 1, col: 2), move: Move(3, outcome: .correct)),
        PDM((row: 2, col: 2), move: Move(4, outcome: .correct)),
        PDM((row: 2, col: 1), move: Move(5, outcome: .correct)),
        PDM((row: 2, col: 0), move: Move(6, outcome: .correct))
    ]), reason: "Long Path to Success", bottomLabel: "Reached end successfully", correctColor: .green, incorrectColor: .red)
}

 func shortPathToSuccess() -> MatrixView {
    return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
        PDM((row: 0, col: 2), move: Move(1, outcome: .correct)),
        PDM((row: 1, col: 1), move: Move(2, outcome: .correct)),
        PDM((row: 2, col: 0), move: Move(3, outcome: .correct))
    ]), reason: "Short Path to Success", bottomLabel: "Can't do better on 3x3 board", correctColor: .green, incorrectColor: .red)
}

 func longPathToFailure() -> MatrixView {
    return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
        PDM((row: 0, col: 0), move: Move(1, outcome: .correct)),
        PDM((row: 0, col: 1), move: Move(2, outcome: .incorrect)),
        PDM((row: 0, col: 2), move: Move(3, outcome: .correct)),
        PDM((row: 1, col: 2), move: Move(4, outcome: .correct)),
        PDM((row: 2, col: 2), move: Move(5, outcome: .incorrect)),
        PDM((row: 2, col: 1), move: Move(6, outcome: .correct)),
        PDM((row: 2, col: 0), move: Move(7, outcome: .incorrect))
    ]), reason: "Long Path to Failure", bottomLabel: "There was hope until move 7 failed\nIt loooked like player needed to avoid two cells", correctColor: .green, incorrectColor: .red)
}

 func shortPathToFailure() -> MatrixView {
    return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
        PDM((row: 0, col: 0), move: Move(1, outcome: .incorrect)),
        PDM((row: 2, col: 0), move: Move(2, outcome: .incorrect))
    ]), reason: "Short Path to Failure", bottomLabel: "Can't Ever Get Either Diagonal", correctColor: .green, incorrectColor: .red)
}

// New 6x6 Examples
 func sixBySixExample1() -> MatrixView {
    return MatrixView(rows: 6, cols: 6, matrix: PDMatrix(rows: 6, cols: 6, pdms: [
        PDM((row: 0, col: 0), move: Move(1, outcome: .correct)),
        PDM((row: 1, col: 1), move: Move(2, outcome: .correct)),
        PDM((row: 2, col: 2), move: Move(3, outcome: .correct)),
        PDM((row: 3, col: 3), move: Move(4, outcome: .correct)),
        PDM((row: 4, col: 4), move: Move(5, outcome: .correct)),
        PDM((row: 5, col: 5), move: Move(6, outcome: .correct))
    ]), reason: "6x6 Path 1", bottomLabel: "Filled upper diagonal correctly", correctColor: .green, incorrectColor: .red)
}

 func sixBySixExample2() -> MatrixView {
    return MatrixView(rows: 6, cols: 6, matrix: PDMatrix(rows: 6, cols: 6, pdms: [
        PDM((row: 0, col: 5), move: Move(6, outcome: .correct)),
        PDM((row: 1, col: 4), move: Move(5, outcome: .correct)),
        PDM((row: 2, col: 3), move: Move(4, outcome: .correct)),
        PDM((row: 3, col: 2), move: Move(3, outcome: .correct)),
        PDM((row: 4, col: 1), move: Move(2, outcome: .correct)),
        PDM((row: 5, col: 0), move: Move(1, outcome: .correct))
    ]), reason: "Bottoms Up", bottomLabel: "Filled lower diagonal correctly", correctColor: .green, incorrectColor: .red)
}

 func sixBySixNiceWinner() -> MatrixView {
    return MatrixView(rows: 6, cols: 6, matrix: PDMatrix(rows: 6, cols: 6, pdms: [
      PDM((row: 0, col: 0), move: Move(1, outcome: .correct)),
      
      PDM((row: 1, col: 1), move: Move(2, outcome: .incorrect)),
        PDM((row: 0, col: 1), move: Move(3, outcome: .correct)),
      
        PDM((row: 1, col: 2), move: Move(4, outcome: .correct)),
        PDM((row: 2, col: 2), move: Move(5, outcome: .correct)),
        PDM((row: 3, col: 3), move: Move(6, outcome: .correct)),
        PDM((row: 4, col: 4), move: Move(7, outcome: .incorrect)),
      
      PDM((row: 4, col: 3), move: Move(8, outcome: .correct)),
      
      PDM((row: 5, col: 4), move: Move(9, outcome: .correct)),
       
        PDM((row: 5, col: 5), move: Move(10, outcome: .correct))
    ]), reason: "Nice Winner", bottomLabel: "Despite two key diagonal losers, the game was won in 10 moves!", correctColor: .green, incorrectColor: .red)
}
