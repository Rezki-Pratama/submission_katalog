
import SwiftUI

struct FavoriteListView: View {
    @ObservedObject private var readFavoriteViewModel = ReadLocalDataViewModel()
    var body: some View {
        VStack(alignment: .center) {
            if readFavoriteViewModel.loading {
                ProgressIndicator(color: Color.gray, size: 50)
            } else if readFavoriteViewModel.favorite.count > 0 {
                List(readFavoriteViewModel.favorite, id: \.gameId) { favorites in
                    ZStack(alignment: .leading) {
                        FavoriteRowView(favorite: favorites)
                        NavigationLink(destination: FavoriteDetailView(favorite: favorites)) {
                            EmptyView()
                        }
                    }
                    
                }.navigationBarTitle(Text("Favorite")).font(.system(size: 18))
                
            } else {
                ErrorView(text: "Empty Data")
            }
        }.onAppear {
            self.readFavoriteViewModel.loadFavorite()
        }    }
}
