import Foundation
import SwiftUI


class GameState: ObservableObject
{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var noughtsScore = 0
    @Published var crossesScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"
      
    
    var xTextColor = String("Turn: X")
    var yTextColor = String("Turn: O")

    
        
    init()
    {
        resetBoard()
    }
    
    
    func turnText() -> String
    {
        return turn == Tile.Cross ? xTextColor : yTextColor

    }
    
    
    
    func placeTile(_ row: Int,_ column: Int)
     {
         if(board[row][column].tile != Tile.Empty)
         {
             return
         }
         
         board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
         
         
         if(checkForVictory())
         {
             if(turn == Tile.Cross)
             {
                 crossesScore += 1
             }
             else
             {
                 noughtsScore += 1
             }
             let winner = turn == Tile.Cross ? "Crosses" : "Noughts"
             alertMessage = winner + " Win!"
             showAlert = true
         }
         else
         {
             turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
         }
         
         if(checkForDraw())
         {
             alertMessage = "Draw"
             showAlert = true
         }
     }
     
     func checkForDraw() -> Bool
     {
         for row in board
         {
             for cell in row
             {
                 if cell.tile == Tile.Empty
                 {
                     return false
                 }
             }
         }
         
         return true
     }
     
     func checkForVictory() -> Bool
     {
        // vertical victory
        // 1
        if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0)
        {
            return true
        }
        // 2
        if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1)
        {
            return true
        }
        // 3
        if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2)
        {
            return true
        }
        
        // horizontal victory
        // 1
        if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2)
        {
            return true
        }
        // 2
        if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2)
        {
            return true
        }
        // 3
        if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2)
        {
            return true
        }
        
        // diagonal victory
        // 1
        if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2)
        {
            return true
        }
        // 2
        if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0)
        {
            return true
        }
                
        
        return false
    }
    
    func isTurnTile(_ row: Int,_ column: Int) -> Bool
    {
        return board[row][column].tile == turn
    }
    
    func resetBoard()
    {
        var newBoard = [[Cell]]()
        
        for _ in 0...2
        {
            var row = [Cell]()
            for _ in 0...2
            {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
