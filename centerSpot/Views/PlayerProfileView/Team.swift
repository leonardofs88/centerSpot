

struct Team: Codable, Identifiable {
    let id: String?
    let name: String?
    let logo: String?
    
    var logoURL: URL? {
        guard let logo else { return nil }
        return URL(string: logo)
    }
}