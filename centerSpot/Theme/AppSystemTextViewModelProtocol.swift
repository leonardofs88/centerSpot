@MainActor
protocol AppSystemTextViewModelProtocol {
    var text: String? { get }
    var weight: AppSystemTextWeight { get }
    var size: CGFloat { get }
    var color: Color { get }
    var fontWeight: String { get }
    
    func setWeight(_ newValue: AppSystemTextWeight)
}

@Observable
class AppSystemTextViewModel: AppSystemTextViewModelProtocol {
    private(set) var text: String?
    private(set) var weight: AppSystemTextWeight {
        didSet {
            getTextConfiguration()
        }
    }
    private(set) var size: CGFloat
    private(set) var color: Color
    private(set) var fontWeight: String = .dinNormal
    
    init(
        _ text: String?,
        weight: AppSystemTextWeight = .regular,
        size: CGFloat = 17,
        color: Color = .blueGray
    ) {
        self.text = text
        self.weight = weight
        self.size = size
        self.color = color
        getTextConfiguration()
    }
    
    func setWeight(_ newValue: AppSystemTextWeight) {
        self.weight = newValue
    }
    
    private func getTextConfiguration() {
        fontWeight = switch weight {
        case .regular:
                .dinNormal
        case .condensed:
                .dinCondensed
        case .condensedBold:
                .dinCondensedBold
        case .bold:
                .dinBold
        }
    }
}