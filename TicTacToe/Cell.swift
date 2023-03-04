import Foundation
import SwiftUI

struct Cell
{
    var tile: Tile
    
    func displayTile() -> String
    {
        switch(tile)
        {
            case Tile.Nought:
                    return "O"
            case Tile.Cross:
                return "X"
            default:
                return ""
        }
    }
    
    func tileColor() -> Color
    {
        switch(tile)
        {
            case Tile.Nought:
                return Color.blue
            case Tile.Cross:
                return Color.orange
            default:
                return Color.orange
        }
    }
}

enum Tile
{
    case Nought
    case Cross
    case Empty
}
