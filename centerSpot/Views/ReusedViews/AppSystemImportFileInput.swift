

struct AppSystemImportFileInput : View {
    
    @State private(set) var fileImporterPresented: Bool = false
    @Binding private var videoPath: String
    
    var body: some View {
        VStack(alignment: .center) {
            if videoPath.isEmpty {
                Button {
                    fileImporterPresented = true
                } label: {
                    AppSystemText("Import file", weight: .bold, color: .blueGray)
                }
                .fileImporter(
                    isPresented: $fileImporterPresented,
                    allowedContentTypes: [.video],
                    onCompletion: { result in
                        switch result {
                        case .success(let success):
                            videoPath = success.absoluteString
                        case .failure(let failure):
                            print(failure.localizedDescription)
                        }
                    })
                .buttonStyle(AppSystemButtonStyle(buttonType: .secondary))
                .padding(5)
            } else {
                HStack {
                    AppSystemText(videoPath)
                }
            }
        }
    }
}