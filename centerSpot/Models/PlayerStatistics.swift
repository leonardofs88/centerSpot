

struct PlayerStatistics: Codable, Identifiable {
    let id: String
    let team: Team?
    let league: League?
    let games: GameData?
    let substitutes: SubstitutionData?
    let shots: Shots?
    let goals: Goals?
    let passes: Passes?
    let tackles: Tackles?
    let dribbles: Dribbles?
    let fouls: Fouls?
    let cards: Cards?
    let penalties: Penalty?
}