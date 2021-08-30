import Foundation
import Combine

class GamesViewModel: ObservableObject {
    @Published var games =  Games(results: [])
    @Published var loading = false
    
    let service: ServiceRepo
    init(service: ServiceRepo = APIService()) {
        self.service = service
    }
    
    func loadGame(){
        self.loading = true
        service.getGame{games in
            
            guard let games = games else{
                return
            }
            
            DispatchQueue.main.async {
                self.loading = false
                self.games.results = games
            }
            
        }
    }
}
