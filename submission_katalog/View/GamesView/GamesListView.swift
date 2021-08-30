import SwiftUI

struct GamesListView : View {
    @ObservedObject var gamesViewModel = GamesViewModel()
    var body: some View {
        VStack(alignment: .center) {
            if gamesViewModel.loading {
                ProgressIndicator(color: Color.gray, size: 50)
            } else if gamesViewModel.games.results.count > 0 {
                List(gamesViewModel.games.results) { game in
                    ZStack(alignment: .leading) {
                        GamesRowView(game: game)
                        NavigationLink(destination: GamesDetailView(game: game)) {
                            EmptyView()
                        }
                    }
                }.navigationTitle(Text("Game")).font(.system(size: 18))
                
            } else {
                ErrorView(text: "Error Data")
                
            }
        }.onAppear {
            self.gamesViewModel.loadGame()
        }    }
}

struct GamesList_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView()
    }
}


