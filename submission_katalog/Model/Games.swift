import Foundation

struct Games: Codable {
    var results : [GameResult]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    
}

struct GameResult: Codable, Identifiable {
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String
    let rating: Float
    let playtime: Int
    let metacritic: Int
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case playtime
        case metacritic
    }
}
