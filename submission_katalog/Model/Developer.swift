
import Foundation

struct Developer: Codable {
    var results: [DeveloperResult]
}

struct DeveloperResult: Codable, Identifiable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let games: [Game]

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case games
    }
}

struct Game: Codable, Identifiable {
    let id: Int
    let slug, name: String
    let added: Int
}
