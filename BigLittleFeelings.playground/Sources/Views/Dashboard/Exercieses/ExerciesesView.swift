import SwiftUI

struct ExercisesView: View {

    var viewModel: ExercisesViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            HStack(alignment: .center, spacing: 24) {
                card(for: .drawing)
            }
            HStack(alignment: .center, spacing: 24) {
                card(for: .affirmations)
            }
        }.fillHorizontally()
    }
    
    private func card(for exercise: Exercise) -> some View {
        MenuCardView(
            viewModel: viewModel.card(for: exercise),
            accentColor: Style.Color.accentColor(for: exercise)
        ).frame(minWidth: 0, maxWidth: .infinity)
    }

}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(viewModel: ExercisesViewModel())
    }
}
