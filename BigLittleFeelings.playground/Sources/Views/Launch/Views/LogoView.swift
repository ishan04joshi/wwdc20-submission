import SwiftUI

struct LogoView: View {
    
    var fontSize: CGFloat
    
    var body: some View {
        HStack(spacing: 12) {
            Text("Big")
                .font(Style.Font.chalk(size: fontSize))
                .foregroundColor(Style.Color.red)
            Text("Little")
                .font(Style.Font.chalk(size: fontSize))
                .foregroundColor(Style.Color.green)
            Text("Feelings.")
                .font(Style.Font.chalk(size: fontSize))
                .foregroundColor(Style.Color.blue)
        }.padding([.top, .bottom], 24)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(fontSize: 60)
    }
}
