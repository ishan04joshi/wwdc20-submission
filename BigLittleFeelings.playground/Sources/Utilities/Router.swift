import SwiftUI

class Router: ObservableObject {
    
    enum Path: Equatable {
        case launch
        indirect case dashboard(Path? = nil)
        case exercise(ExercisePath)
        case profile
        case knowledge
    }
    
    enum ExercisePath: Equatable {
        case drawing(Drawing? = nil)
        case affirmations(String? = nil)
    }
    
    @Published var current: Path
    
    init(initial path: Path = .launch) {
        current = path
    }
    
}
