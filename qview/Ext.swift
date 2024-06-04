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
    ]), reason: "Almost All Filled But Success", bottomLabel: "4-7-2-5-9-13", correctColor: .green, incorrectColor: .red)
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
      PDM((row:5, col:4), move: Move(8, outcome: .correct)),
        PDM((row: 5, col: 5), move: Move(9, outcome: .correct))
    ]), reason: "Nice Winner", bottomLabel: "Despite two key diagonal losers, the game was won in 10 moves!", correctColor: .green, incorrectColor: .red)
}
 func borderAdjacency() -> MatrixView {
  return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
    PDM((row: 1, col: 0), move: Move(1, outcome: .incorrect, text: "flag.fill", useSymbol: true)),
    PDM((row: 0, col: 0), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
    PDM((row: 1, col: 1), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
    PDM((row: 0, col: 1), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
    PDM((row: 2, col: 0), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
    PDM((row: 2, col: 1), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
  ]), reason: "Border Adjacency", bottomLabel: "The border cells have 5 adjacent cells", correctColor: .yellow, incorrectColor: .blue)
}
 func startInAnyCorner() -> MatrixView {
  return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
    
    PDM((row: 0, col: 0), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
    
    PDM((row: 0, col: 2), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
    PDM((row: 2, col: 0), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
    PDM((row: 2, col:2), move: Move(0, outcome: .correct, text: "checkmark", useSymbol: true)),
  ]), reason: "Start In Any Corner", bottomLabel: "Do We Want This Rule?", correctColor: .yellow, incorrectColor: .blue)
}
 func move0() -> MatrixView {
  return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
    PDM((row: 2, col: 0), move: Move(0, outcome: .correct, text: "1.circle", useSymbol: true)),
  ]), reason: "Let's Start Here", bottomLabel: "Picking A Friendly Topic and Question", correctColor: .yellow, incorrectColor: .blue)
}
 func move1() -> MatrixView {
  return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
    PDM((row: 1, col: 1), move: Move(0, outcome: .correct, text: "2.circle", useSymbol: true)),
    PDM((row: 2, col: 0), move: Move(0, outcome: .correct, text: "1.circle", useSymbol: true)),
    
  ]), reason: " Now Go To the Center", bottomLabel: "The center is often a good choice", correctColor: .yellow, incorrectColor: .blue)
}

func nonAdjecntMove() -> MatrixView {
  return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
    PDM((row: 2, col: 2), move: Move(0, outcome: .correct, text: "xmark.circle", useSymbol: true)),
    PDM((row: 2, col: 0), move: Move(0, outcome: .correct, text: "1.circle", useSymbol: true)),
    
  ]), reason: "You Can't Move Here", bottomLabel: "It's not adjacent!", correctColor: .yellow, incorrectColor: .blue)
}
 func move2() -> MatrixView {
  return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
    PDM((row: 1, col: 1), move: Move(0, outcome: .correct, text: "2.circle", useSymbol: true)),
    PDM((row: 2, col: 0), move: Move(0, outcome: .correct, text: "1.circle", useSymbol: true)),
    PDM((row: 0, col: 2), move: Move(0, outcome: .correct, text: "3.circle", useSymbol: true)),
  ]), reason: "Good Job, Now Finish Up", bottomLabel: "If you answer the associated questions correctly,  you win!", correctColor: .yellow, incorrectColor: .blue)
}
