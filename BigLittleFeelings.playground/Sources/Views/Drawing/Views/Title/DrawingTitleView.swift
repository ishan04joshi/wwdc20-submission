import SwiftUI

struct DrawingTitleView: View {
    
    @Binding var emotion: Emotion
    
    var body: some View {
        VStack {
            Text("I look like this when I feel")
                .font(Style.Font.font(size: 23))
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 4)
            Text(emotion.rawValue.capitalized)
                .font(Style.Font.chalk(size: 28))
                .underline()
                .bold()
                .multilineTextAlignment(.center)
                .frame(width: 300, alignment: .center)
                .animation(.none)
        }.foregroundColor(Style.Color.black)
            .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
            .background(Style.Color.accentColor(for: .drawing))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: Style.Color.lightGray, radius: 2)
    }
}

struct DrawingTitleView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingTitleView(emotion: .constant(.boredom))
    }
}
