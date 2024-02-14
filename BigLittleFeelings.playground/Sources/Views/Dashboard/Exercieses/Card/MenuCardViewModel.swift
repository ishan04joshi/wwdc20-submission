import SwiftUI

final class MenuCardViewModel {

    let exercise: Exercise
    
    var icon: String { exercise.icon }
    var title: String { exercise.title.capitalized }
    var subtitle: String { exercise.shortDescription }
    
    var path: Router.ExercisePath {
        if exercise == .drawing {
            return .drawing()
        } else if exercise == .affirmations {
            return .affirmations()
        }
        return .affirmations()
    }

    
    init(exercise: Exercise = .emotions) {
        self.exercise = exercise
    }
    
}
