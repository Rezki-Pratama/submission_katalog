import SwiftUI
import WebKit

struct GamesDetailView : View {
    @ObservedObject var gamesDetailViewModel = GamesDetailViewModel()
    @ObservedObject var readFavoriteViewModel = ReadLocalDataViewModel()
    @ObservedObject var readFavoriteIdViewModel = ReadByIdDataViewModel ()
    @ObservedObject var addFavoriteViewModel = CreateLocalDataViewModel()
    @ObservedObject var deleteFavoriteViewModel = DeleteLocalDataViewModel()
    @State var isSaved = true
    var game: GameResult
    var body: some View {
        VStack(alignment: .center) {
            if gamesDetailViewModel.loading {
                ProgressIndicator(color: Color.gray, size: 50)
            } else {
                ScrollView {
                    VStack {
                        Spacer(minLength: 20)
                        ImageWithURL(game.backgroundImage, width: 150, height: 200, cornerRadius: 10)
                        VStack(alignment: .leading) {
                            Spacer(minLength: 25)
                            Text(gamesDetailViewModel.gamesDetail.name)
                                .font(.system(size: 25))
                                .bold()
                            Spacer(minLength: 25)
                            HStack {
                                Text(gamesDetailViewModel.gamesDetail.released)
                                    .font(.system(size: 20))
                                    .bold()
                                Spacer()
                                Text("Rating: \(gamesDetailViewModel.gamesDetail.rating.formatDouble())")
                                    .font(.system(size: 20))
                                    .bold()
                            }
                            Spacer(minLength: 35)
                            
                            Text("Description")
                                .font(.system(size: 20))
                            Spacer(minLength: 10)
                            Text(gamesDetailViewModel.gamesDetail.gamesDetailDescription.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil))                        }
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            }
            
        }.onAppear {
            self.gamesDetailViewModel.loadGamesDetail(id: game.id)
            self.readFavoriteIdViewModel.loadFavoriteId(gameId: Int32(game.id))
        }
        .navigationBarTitle(Text("Detail Game"), displayMode: .inline)        .font(.system(size: 15))
        .navigationBarItems(trailing:self.readFavoriteIdViewModel.favorite.gameId == 0 || self.isSaved == false ? Button(action: {
            if self.gamesDetailViewModel.gamesDetail.id != 0 {
                self.addFavoriteViewModel.gameId = Int32(self.gamesDetailViewModel.gamesDetail.id)
                self.addFavoriteViewModel.gameName = self.gamesDetailViewModel.gamesDetail.name
                self.addFavoriteViewModel.gameDescription = self.gamesDetailViewModel.gamesDetail.gamesDetailDescription
                self.addFavoriteViewModel.gameBackgroundImage = self.gamesDetailViewModel.gamesDetail.backgroundImage
                self.addFavoriteViewModel.gameRating = Float(self.gamesDetailViewModel.gamesDetail.rating)
                
                self.addFavoriteViewModel.gameRelease = self.gamesDetailViewModel.gamesDetail.released
                
                let save = self.addFavoriteViewModel.addFavorite()
                if (save) {
                    self.isSaved = save
                }
                self.readFavoriteIdViewModel.loadFavoriteId(gameId: self.gamesDetailViewModel.gamesDetail.id)
            }
        }){
            Image(systemName:"heart")
        } : Button(action: {
            if self.gamesDetailViewModel.gamesDetail.id != 0 {
                self.deleteFavoriteViewModel.gameId = self.gamesDetailViewModel.gamesDetail.id
                
                let remove = self.deleteFavoriteViewModel.deleteFavorite()
                
                if(remove) {
                    self.isSaved = false
                } else {
                    self.isSaved = true
                }
                
                self.readFavoriteIdViewModel.loadFavoriteId(gameId: self.gamesDetailViewModel.gamesDetail.id)
            }
        }){
            Image(systemName:"heart.fill")
        }
        ).accessibility(identifier: "favoriteButton")
    }
}
