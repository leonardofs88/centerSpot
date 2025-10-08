

struct Shots: Codable {
    let total: Int?
    let onValue: Int?
    
    enum CodingKeys: String, CodingKey {
        case total = "total"
        case onValue = "on"
    }
}