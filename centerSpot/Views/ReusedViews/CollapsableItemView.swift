
struct CollapsableItemView: View {
    @State private(set) var title: String
    @State private(set) var description: String
    
    var body: some View {
        HStack {
            AppSystemText(viewModel: AppSystemTextViewModel(title,
                                                            weight: .condensedBold))
            Spacer()
            AppSystemText(
                viewModel: AppSystemTextViewModel(description,
                                                  weight: .bold)
            )
        }
    }
}