import SwiftUI

struct DashboardView: View  {
    
    var viewModel: DashboardViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            ExercisesView(viewModel: self.viewModel.exercises)
                .frame(maxWidth: 800)
                .aspectRatio(2.5, contentMode: .fit)
            Spacer()
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel(store: Store()))
            .environmentObject(Router())
    }
}
