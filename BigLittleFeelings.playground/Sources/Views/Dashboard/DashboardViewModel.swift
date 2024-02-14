import SwiftUI

final class DashboardViewModel {
    
    private let store: Store
    
    var title: String { "Hello, \(store.user.name)!" }
    var exercises: ExercisesViewModel {
        ExercisesViewModel(user: store.user)
    }
    
    init(store: Store) {
        self.store = store
    }
    
}
