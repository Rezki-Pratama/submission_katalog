
import Foundation

class GamesDetailViewModel: ObservableObject {
    @Published var gamesDetail =  GamesDetail(
    id: 0, name: "", gamesDetailDescription: "", released: "", backgroundImage: "", rating: 0)
    @Published var loading = false
    
    let service: ServiceRepo
    init(service: ServiceRepo = APIService()) {
        self.service = service
    }
    
    func loadGamesDetail(id: Int){
        self.loading = true
        service.getGameDetail(id: id){gamesDetail in
            
            guard let gamesDetail = gamesDetail else{
                return
            }
            
            DispatchQueue.main.async {
                self.loading = false
                self.gamesDetail = gamesDetail
            }
            
        }
    }

}
