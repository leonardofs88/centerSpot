
struct TextFormItemView: View {
    private(set) var title: String
    private(set) var hint: String?
    @Binding private(set) var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            AppSystemText(title, size: 20 )
            if let hint {
                TextField(hint, text: $text)
            } else {
                TextField(text, text: $text)
            }
        }
    }
}