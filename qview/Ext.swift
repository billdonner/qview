//
//  Ext.swift
//  qview
//
//  Created by bill donner on 6/3/24.
//

import SwiftUI

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

// Helper function to convert number to equivalent circled SF Symbol
func ntoSF(_  number:  Int) -> String {
      return "\(number).circle"
}
func notA3x3Winner(isPresented:Binding<Bool>) -> MatrixView {
    return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
        PDM((row: 0, col: 0), move: Move(.correct, text: ntoSF(1))),
        PDM((row: 0, col: 1), move: Move(.incorrect, text: ntoSF(6))),
        PDM((row: 0, col: 2), move: Move(.correct, text: ntoSF(3))),
        PDM((row: 1, col: 1), move: Move(.incorrect, text: ntoSF(2))),
        PDM((row: 1, col: 2), move: Move(.correct, text: ntoSF(4))),
        PDM((row: 2, col: 1), move: Move(.incorrect, text: ntoSF(7))),
        PDM((row: 2, col: 2), move: Move(.correct, text: ntoSF(5))),
    ]), reason: "Tough Loss", bottomLabel: "Not a winner", correctColor: .green, incorrectColor: .red, isPresented: isPresented)
}

func cornerAdjacency(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 0, col: 0), move: Move(.incorrect, text: "flag.fill")),
      PDM((row: 1, col: 1), move: Move(.correct, text: "checkmark")),
      PDM((row: 1, col: 0), move: Move(.correct, text: "checkmark")),
      PDM((row: 0, col: 1), move: Move(.correct, text: "checkmark")),
    ]),
    reason: "Corner Adjacency",
    bottomLabel: "The corner cells have only 3 adjacent cells",
    correctColor: .yellow,
    incorrectColor: .blue,
    isPresented: isPresented
  )
}

func interiorAdjacency(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 1, col: 1), move: Move(.incorrect, text: "flag.fill")),
      PDM((row: 0, col: 0), move: Move(.correct, text: "checkmark")),
      PDM((row: 0, col: 2), move: Move(.correct, text: "checkmark")),
      PDM((row: 2, col: 0), move: Move(.correct, text: "checkmark")),
      PDM((row: 1, col: 0), move: Move(.correct, text: "checkmark")),
      PDM((row: 2, col: 2), move: Move(.correct, text: "checkmark")),
      PDM((row: 1, col: 2), move: Move(.correct, text: "checkmark")),
      PDM((row: 0, col: 1), move: Move(.correct, text: "checkmark")),
      PDM((row: 2, col: 1), move: Move(.correct, text: "checkmark")),
    ]),
    reason: "Interior Adjacency",
    bottomLabel: "Each interior cell has up to 8 adjacent cells",
    correctColor: .yellow,
    incorrectColor: .blue,
    isPresented: isPresented
  )
}

func allFilledButWinningPath(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 4, cols: 4,
    matrix: PDMatrix(rows: 4, cols: 4, pdms: [
      PDM((row: 0, col: 0), move: Move(.incorrect, text: ntoSF(1))),
      PDM((row: 0, col: 1), move: Move(.correct, text: ntoSF(2))),
      PDM((row: 0, col: 2), move: Move(.incorrect, text: ntoSF(3))),
      PDM((row: 0, col: 3), move: Move(.correct, text: ntoSF(4))),
      PDM((row: 1, col: 0), move: Move(.correct, text: ntoSF(5))),
      PDM((row: 1, col: 1), move: Move(.incorrect, text: ntoSF(6))),
      PDM((row: 1, col: 2), move: Move(.correct, text: ntoSF(7))),
      PDM((row: 1, col: 3), move: Move(.incorrect, text: ntoSF(8))),
      PDM((row: 2, col: 0), move: Move(.correct, text: ntoSF(9))),
      PDM((row: 2, col: 1), move: Move(.incorrect, text: ntoSF(10))),
      PDM((row: 2, col: 2), move: Move(.correct, text: ntoSF(11))),
      PDM((row: 2, col: 3), move: Move(.incorrect, text: ntoSF(12))),
      PDM((row: 3, col: 0), move: Move(.correct, text: ntoSF(13))),
    ]),
    reason: "Almost All Filled But Success",
    bottomLabel: "4-7-2-5-9-13",
    correctColor: .green,
    incorrectColor: .red,
    isPresented: isPresented
  )
}

func longPathToSuccess(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 0, col: 2), move: Move(.correct, text: ntoSF(1))),
      PDM((row: 1, col: 1), move: Move(.incorrect, text: ntoSF(2))),
      PDM((row: 1, col: 2), move: Move(.correct, text: ntoSF(3))),
      PDM((row: 2, col: 2), move: Move(.correct, text: ntoSF(4))),
      PDM((row: 2, col: 1), move: Move(.correct, text: ntoSF(5))),
      PDM((row: 2, col: 0), move: Move(.correct, text: ntoSF(6))),
    ]),
    reason: "Long Path to Success",
    bottomLabel: "Reached end successfully",
    correctColor: .green,
    incorrectColor: .red,
    isPresented: isPresented
  )
}

func shortPathToSuccess(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 0, col: 2), move: Move(.correct, text: ntoSF(1))),
      PDM((row: 1, col: 1), move: Move(.correct, text: ntoSF(2))),
      PDM((row: 2, col: 0), move: Move(.correct, text: ntoSF(3))),
    ]),
    reason: "Short Path to Success",
    bottomLabel: "Can't do better on 3x3 board",
    correctColor: .green,
    incorrectColor: .red,
    isPresented: isPresented
  )
}

func longPathToFailure(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 0, col: 0), move: Move(.correct, text: ntoSF(1))),
      PDM((row: 0, col: 1), move: Move(.incorrect, text: ntoSF(2))),
      PDM((row: 0, col: 2), move: Move(.correct, text: ntoSF(3))),
      PDM((row: 1, col: 2), move: Move(.correct, text: ntoSF(4))),
      PDM((row: 2, col: 2), move: Move(.incorrect, text: ntoSF(5))),
      PDM((row: 2, col: 1), move: Move(.correct, text: ntoSF(6))),
      PDM((row: 2, col: 0), move: Move(.incorrect, text: ntoSF(7))),
    ]),
    reason: "Long Path to Failure",
    bottomLabel: "There was hope until move 7 failed\nIt looked like player needed to avoid two cells",
    correctColor: .green,
    incorrectColor: .red,
    isPresented: isPresented
  )
}

func shortPathToFailure(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 0, col: 0), move: Move(.incorrect, text: ntoSF(1))),
      PDM((row: 2, col: 0), move: Move(.incorrect, text: ntoSF(2))),
    ]),
    reason: "Short Path to Failure",
    bottomLabel: "Can't Ever Get Either Diagonal",
    correctColor: .green,
    incorrectColor: .red,
    isPresented: isPresented
  )
}

func sixBySixExample1(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 6, cols: 6,
    matrix: PDMatrix(rows: 6, cols: 6, pdms: [
      PDM((row: 0, col: 0), move: Move(.correct, text: ntoSF(1))),
      PDM((row: 1, col: 1), move: Move(.correct, text: ntoSF(2))),
      PDM((row: 2, col: 2), move: Move(.correct, text: ntoSF(3))),
      PDM((row: 3, col: 3), move: Move(.correct, text: ntoSF(4))),
      PDM((row: 4, col: 4), move: Move(.correct, text: ntoSF(5))),
      PDM((row: 5, col: 5), move: Move(.correct, text: ntoSF(6))),
    ]),
    reason: "6x6 Path 1",
    bottomLabel: "Filled upper diagonal correctly",
    correctColor: .green,
    incorrectColor: .red,
    isPresented: isPresented
  )
}

func bottomsUp(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 6, cols: 6,
    matrix: PDMatrix(rows: 6, cols: 6, pdms: [
      PDM((row: 0, col: 5), move: Move(.correct, text: ntoSF(6))),
      PDM((row: 1, col: 4), move: Move(.correct, text: ntoSF(5))),
      PDM((row: 2, col: 3), move: Move(.correct, text: ntoSF(4))),
      PDM((row: 3, col: 2), move: Move(.correct, text: ntoSF(3))),
      PDM((row: 4, col: 1), move: Move(.correct, text: ntoSF(2))),
      PDM((row: 5, col: 0), move: Move(.correct, text: ntoSF(1))),
    ]),
    reason: "Bottoms Up",
    bottomLabel: "Filled lower diagonal correctly",
    correctColor: .green,
    incorrectColor: .red,
    isPresented: isPresented
  )
}

func niceWinner(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 6, cols: 6,
    matrix: PDMatrix(rows: 6, cols: 6, pdms: [
      PDM((row: 0, col: 0), move: Move(.correct, text: ntoSF(1))),
      PDM((row: 1, col: 1), move: Move(.incorrect, text: ntoSF(2))),
      PDM((row: 0, col: 1), move: Move(.correct, text: ntoSF(3))),
      PDM((row: 1, col: 2), move: Move(.correct, text: ntoSF(4))),
      PDM((row: 2, col: 2), move: Move(.correct, text: ntoSF(5))),
      PDM((row: 3, col: 3), move: Move(.correct, text: ntoSF(6))),
      PDM((row: 4, col: 4), move: Move(.incorrect, text: ntoSF(7))), 
      PDM((row: 4, col: 3), move: Move(.correct, text: ntoSF(8))),
      PDM((row: 5, col: 4), move: Move(.correct, text: ntoSF(9))),
      PDM((row: 5, col: 5), move: Move(.correct, text: ntoSF(10))),
    ]),
    reason: "Nice Winner",
    bottomLabel: "Despite two key diagonal losers, the game was won in 10 moves!",
    correctColor: .green,
    incorrectColor: .red,
    isPresented: isPresented
  )
}

func borderAdjacency(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 1, col: 0), move: Move(.incorrect, text: "flag.fill")),
      PDM((row: 0, col: 0), move: Move(.correct, text: "checkmark")),
      PDM((row: 1, col: 1), move: Move(.correct, text: "checkmark")),
      PDM((row: 0, col: 1), move: Move(.correct, text: "checkmark")),
      PDM((row: 2, col: 0), move: Move(.correct, text: "checkmark")),
      PDM((row: 2, col: 1), move: Move(.correct, text: "checkmark")),
    ]),
    reason: "Border Adjacency",
    bottomLabel: "The border cells have 5 adjacent cells",
    correctColor: .yellow,
    incorrectColor: .blue,
    isPresented: isPresented
  )
}

func startInAnyCorner(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 0, col: 0), move: Move(.correct, text: "checkmark")),
      PDM((row: 0, col: 2), move: Move(.correct, text: "checkmark")),
      PDM((row: 2, col: 0), move: Move(.correct, text: "checkmark")),
      PDM((row: 2, col: 2), move: Move(.correct, text: "checkmark")),
    ]),
    reason: "Start In Any Corner",
    bottomLabel: "Do We Want This Rule?",
    correctColor: .yellow,
    incorrectColor: .blue,
    isPresented: isPresented
  )
}

func move0(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 2, col: 0), move: Move(.correct, text: "1.circle")),
    ]),
    reason: "Let's Start Here",
    bottomLabel: "Picking A Friendly Topic and Question",
    correctColor: .yellow,
    incorrectColor: .blue,
    isPresented: isPresented
  )
}

func move1(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 1, col: 1), move: Move(.correct, text: "2.circle")),
      PDM((row: 2, col: 0), move: Move(.correct, text: "1.circle")),
    ]),
    reason: " Now Go To the Center",
    bottomLabel: "The center is often a good choice",
    correctColor: .yellow,
    incorrectColor: .blue,
    isPresented: isPresented
  )
}

func nonAdjecntMove(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(
    rows: 3, cols: 3,
    matrix: PDMatrix(rows: 3, cols: 3, pdms: [
      PDM((row: 2, col: 2), move: Move(.correct, text: "xmark.circle")),
      PDM((row: 2, col: 0), move: Move(.correct, text: "1.circle")),
    ]),
    reason: "You Can't Move Here",
    bottomLabel: "It's not adjacent!",
    correctColor: .yellow,
    incorrectColor: .blue,
    isPresented: isPresented
  )
}
func move2(isPresented: Binding<Bool>) -> MatrixView {
  return MatrixView(rows: 3, cols: 3, matrix: PDMatrix(rows: 3, cols: 3, pdms: [
    PDM((row: 1, col: 1), move: Move(.correct, text: "2.circle")),
    PDM((row: 2, col: 0), move: Move(.correct, text: "1.circle")),
    PDM((row: 0, col: 2), move: Move(.correct, text: "3.circle")),
  ]), reason: "Good Job, Now Finish Up", bottomLabel: "If you answer the associated questions correctly,  you win!", correctColor: .yellow, incorrectColor: .blue, isPresented: isPresented)
}
