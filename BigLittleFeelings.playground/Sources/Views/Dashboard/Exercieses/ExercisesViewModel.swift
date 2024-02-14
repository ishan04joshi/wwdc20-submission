import SwiftUI

final class ExercisesViewModel {
    
    private let user: User
    
    init(user: User = .mock) {
        self.user = user
    }
    
    func card(for exercise: Exercise) -> MenuCardViewModel {
        MenuCardViewModel(exercise: exercise)
    }
    
}
