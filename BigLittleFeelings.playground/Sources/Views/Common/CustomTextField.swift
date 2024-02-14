import SwiftUI

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .center) {
            if text.isEmpty {
                HStack {
                    Spacer()
                    placeholder
                    Spacer()
                }
            }
            TextField(
                "", text: $text, onEditingChanged: editingChanged, onCommit: commit
            ).aspectRatio(contentMode: .fill)
        }.fillHorizontally()
    }
}
