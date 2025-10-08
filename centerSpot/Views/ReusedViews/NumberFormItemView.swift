


struct NumberFormItemView: View {
    private(set) var title: String
    private(set) var hint: String?
    @Binding private(set) var number: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            AppSystemText(title, size: 20 )
            if let hint {
                TextField(hint, value: $number, format: .number)
            } else {
                TextField(title, value: $number, format: .number)
            }
        }
    }
}