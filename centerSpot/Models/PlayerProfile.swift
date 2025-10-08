

struct PlayerProfile: Codable, Identifiable {
    let id: Int
    let name: String
    let firstName: String
    let lastname: String
    let age: Int
    let nationality: String
    let height: String
    let weight: String
    let number: Int
    let position: String
    let photo: String
}
