
import Foundation

fileprivate let baseURL = "https://api.rawg.io/api/"

class APIService : ServiceRepo {
    func getGame(completion: @escaping ([GameResult]?) -> Void) {
        guard let url = URL(string: "\(baseURL)games?key=194144d538db418a95480673936c184a&page=1") else {return}
        URLSession.shared.dataTask(with: url){ (data, _, error) in
            

            guard let data = data else{
                completion(nil)
                return
            }
            guard let game = try? JSONDecoder().decode(Games.self, from: data) else{
                completion(nil)
                return
            }
            
            
            
                        
            DispatchQueue.main.async {
                completion(game.results)
                
            }
        }.resume()
    }
    
    func getDeveloper(completion: @escaping ([DeveloperResult]?) -> Void) {
        guard let url = URL(string: "\(baseURL)developers?key=194144d538db418a95480673936c184a&page=1") else {return}
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else{
                completion(nil)
                return
            }
            guard let developer = try? JSONDecoder().decode(Developer.self, from: data) else{
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(developer.results)
            }
        }.resume()
    }
    
    func getGameDetail(id: Int ,completion: @escaping (GamesDetail?) -> Void) {
        guard let url = URL(string: "\(baseURL)games/\(id)?key=194144d538db418a95480673936c184a") else {return}
        
        URLSession.shared.dataTask(with: url){ (data, _, error) in
            

            guard let data = data else{
                completion(nil)
                return
            }
            
            guard let game = try? JSONDecoder().decode(GamesDetail.self, from: data) else{
                completion(nil)
                return
            }
                        
            DispatchQueue.main.async {
                completion(game)
            }
        }.resume()
    }
}

protocol ServiceRepo {
    func getDeveloper(completion: @escaping ([DeveloperResult]?) -> Void)
    func getGame(completion: @escaping ([GameResult]?) -> Void)
    func getGameDetail(id: Int, completion: @escaping (GamesDetail?) -> Void)
}
