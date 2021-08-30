
import SwiftUI

struct DeveloperDetailView: View {
    var developer: DeveloperResult
    var body: some View {
        let games: [Game] = self.developer.games
        ScrollView {
            VStack {
                Spacer(minLength: 20)
                ImageWithURL(developer.imageBackground, width: 150, height: 200, cornerRadius: 10)
                Spacer(minLength: 25)
                Text(developer.name)
                    .font(.system(size: 25))
                    .bold()
                Spacer(minLength: 35)
                VStack(alignment: .leading) {
                    Text("List of Games")
                        .font(.system(size: 20))
                        .bold()
                    Spacer(minLength: 10)
                    ForEach(games) {game in
                        VStack(alignment: .leading) {
                            Text(game.name)
                                .bold().padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                        }
                    }
                }
            }
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        .navigationBarTitle(Text("Detail Favorite"), displayMode: .inline)
        .font(.system(size: 15))
    }
}
