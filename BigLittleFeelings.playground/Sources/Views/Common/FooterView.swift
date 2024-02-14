import SwiftUI

struct FooterView: View {

    let title: String
    
    var body: some View {
        Text(title)
            .font(Style.Font.font(size: 16))
            .foregroundColor(Style.Color.black)
            .bold()
            .multilineTextAlignment(.leading)
            .fillHorizontally()
    }
    
    init(title: String = Strings.footer) {
        self.title = title
    }
    
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
