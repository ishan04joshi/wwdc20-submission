import SwiftUI

struct DrawingView: View {
    
    @EnvironmentObject private var router: Router
    
    @ObservedObject var viewModel: DrawingViewModel
    
    @State var color: Color = .black
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer(minLength: 12)
            DrawingTitleView(emotion: $viewModel.emotion)
            Spacer(minLength: 12)
            canvas
            controls
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
}

// MARK: - Subviews
extension DrawingView {
    private var canvas: some View {
        CanvasView(strokes: $viewModel.strokes, color: $color)
            .aspectRatio(1, contentMode: .fit)
            .shadow(color: Style.Color.lightGray, radius: 18, x: 0, y: 0)
    }
    private var controls: some View {
        ZStack {
            HStack {
                ColorPickerView(selected: $color)
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: { self.viewModel.emotion = .random }) {
                    Text("🎲 try different emotion")
                        .font(Style.Font.font(style: .footnote))
                }.foregroundColor(Color(white: 0.2)).padding(.trailing, 12)
            }
            Button(action: {
                self.viewModel.save()
                self.router.current = .dashboard()
            }) {
                Text(Strings.save)
                    .font(Style.Font.font(style: .headline))
                    .foregroundColor(.white)
                    .bold()
                    .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                    .background(Style.Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        }.padding(.all, 12)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView(viewModel: DrawingViewModel(store: Store()))
            .environmentObject(Router())
    }
}
