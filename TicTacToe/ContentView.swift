import SwiftUI

struct ContentView: View
{
    @StateObject var gameState = GameState()
    
    var body: some View
    {
        let borderSize = CGFloat(10)
        
        VStack(spacing: borderSize)
        {
            ForEach(0...2, id: \.self)
            {
                row in
                HStack(spacing: borderSize)
                {
                    ForEach(0...2, id: \.self)
                    {
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        Text(cell.displayTile())
                            .font(.system(size:60))
                            .foregroundColor(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
