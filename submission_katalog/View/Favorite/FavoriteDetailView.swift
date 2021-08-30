
import SwiftUI

struct FavoriteDetailView: View {
    @ObservedObject var readFavoriteViewModel = ReadLocalDataViewModel()
    @ObservedObject var readFavoriteIdViewModel = ReadByIdDataViewModel ()
    @ObservedObject var addFavoriteViewModel = CreateLocalDataViewModel()
    @ObservedObject var deleteFavoriteViewModel = DeleteLocalDataViewModel()
    @Environment(\.presentationMode) var presentationMode
    var favorite : LocalDataViewModel
    var body: some View {
        VStack(alignment: .center) {
            ScrollView {
                VStack {
                    Spacer(minLength: 20)
                    ImageWithURL(favorite.gameBackgroundImage , width: 150, height: 200, cornerRadius: 10)
                    VStack(alignment: .leading) {
                        Spacer(minLength: 25)
                        Text(favorite.gameName )
                            .font(.system(size: 25))
                            .bold()
                        Spacer(minLength: 25)
                        HStack {
                            Text(favorite.gameRelease )
                                .font(.system(size: 20))
                                .bold()
                            Spacer()
                            Text("Rating: \(favorite.gameRating.formatFloat())")
                                .font(.system(size: 20))
                                .bold()
                        }
                        Spacer(minLength: 35)
                        
                        Text("Description")
                            .font(.system(size: 20))
                        Spacer(minLength: 10)
                        Text(favorite.gameDescription.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil) )                        }
                }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        }
        .navigationBarTitle(Text("Detail Favorite"), displayMode: .inline)        .font(.system(size: 15))
        .navigationBarItems(trailing: Button(action: {
            
            self.deleteFavoriteViewModel.gameId = self.favorite.gameId
            let remove = self.deleteFavoriteViewModel.deleteFavorite()
            
            if(remove) {
                self.presentationMode.wrappedValue.dismiss()
            } else {
                print("Failed remove")
            }
            
            self.readFavoriteIdViewModel.loadFavoriteId(gameId: self.favorite.gameId)
            
        }){
            Text("Remove")
        })
    }
}
