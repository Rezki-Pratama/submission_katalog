import Foundation

struct GamesDetail: Codable {
    let id: Int32
    let name, gamesDetailDescription, released: String
    let backgroundImage: String
    let rating: Double
    enum CodingKeys: String, CodingKey {
        case id, name
        case gamesDetailDescription = "description"
        case released
        case backgroundImage = "background_image"
        case rating
    }
}
