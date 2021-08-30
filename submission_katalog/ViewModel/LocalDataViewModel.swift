import Foundation

class LocalDataViewModel {
    var favorite: Favorite
    
    init(favorite: Favorite) {
        self.favorite = favorite
    }
    
    var gameId: Int32 {
        self.favorite.gameId
    }
    
    var gameName: String {
        self.favorite.gameName ?? ""
    }
    
    var gameDescription: String {
        self.favorite.gameDescription ?? ""
    }
    
    var gameBackgroundImage: String {
        self.favorite.gameBackgroundImage ?? ""
    }
    
    var gameRating: Float {
        self.favorite.gameRating
    }
    
    var gameRelease: String {
        self.favorite.gameRelease ?? ""
    }
}

class ReadLocalDataViewModel: ObservableObject {
    @Published var favorite = [LocalDataViewModel]()
    @Published var loading: Bool = false
    
    init() {
        loadFavorite()
    }
    
    func loadFavorite() {
        self.loading = true
        DispatchQueue.main.async {
            self.loading = false
            self.favorite = LocalData.shared.getAllFavorite().map(LocalDataViewModel.init)
        }
    }
}

class  ReadByIdDataViewModel: ObservableObject {
    @Published var favorite = FavoriteGameModel(
        gameId: 0, gameName: "", gameRelease: "", gameBackgroundImage: "", gameRating: 0.0, gameDescription: ""
    )
    @Published var loading: Bool = false
    
    func loadFavoriteId(gameId: Int32) {
        self.loading = true
        LocalData.shared.getFavoriteById(gameId) {
            favorite in
            self.loading = false
            guard let favorite = favorite else {
                return
            }
            self.favorite = favorite
        }
    }
}

class CreateLocalDataViewModel: ObservableObject {
    var gameId: Int32 = 0
    var gameName: String = ""
    var gameDescription: String = ""
    var gameBackgroundImage: String = ""
    var gameRating: Float = 0.0
    var gameRelease: String = ""
    
    private var favorite: Favorite {
        let favorite = Favorite(context: LocalData.shared.managedObjectContext)
        favorite.gameId = gameId
        favorite.gameName = gameName
        favorite.gameDescription = gameDescription
        favorite.gameBackgroundImage = gameBackgroundImage
        favorite.gameRating = gameRating
        favorite.gameRelease = gameRelease
        return favorite
    }
    
    func addFavorite() -> Bool {
        do {
            try LocalData.shared.addFavoriteGame(favoriteGame: favorite)
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
    
}

class DeleteLocalDataViewModel: ObservableObject {
    var gameId: Int32 = 0
    func deleteFavorite() -> Bool {
        do {
            try LocalData.shared.deleteFavorite(gameId: gameId)
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
}

