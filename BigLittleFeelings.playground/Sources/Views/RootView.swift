import SwiftUI

public struct RootView: View {
    
    @ObservedObject private var router = Router()
    @ObservedObject private var store = Store()
    
    public var body: some View {
        ZStack {
            if router.current == .launch {
                LaunchView(viewModel: LaunchViewModel(store: store))
                    .transition(.move(edge: .bottom))
                
            } else if router.current == .dashboard() {
                DashboardView(viewModel: DashboardViewModel(store: store))
                
            }else if drawing(from: router.current) != nil {
                drawing(from: router.current).map {
                    DrawingView(
                        viewModel: DrawingViewModel(builder: $0, store: store)
                    ).transition(.move(edge: .bottom))
                }
                
            } else if router.current == .dashboard(.exercise(.affirmations())) {
                AffirmationsView(viewModel: AffirmationsViewModel(
                    store: store
                )).transition(.move(edge: .bottom))
                
            }
        }.animation(.easeInOut(duration: 0.3))
            .environmentObject(router)
            .environmentObject(store)
    }
    
    init(user: User? = nil) {
        user.map(store.save)
        router.current = .launch
    }
    
    private func exercise(from path: Router.Path?) -> Router.ExercisePath? {
        if case .dashboard(let subpath) = path {
            if case .exercise(let exercise) = subpath { return exercise }
        }
        return nil
    }
    
    
    
    private func drawing(from path: Router.Path?) -> DrawingBuilder? {
        if let path = exercise(from: path) {
            if case .drawing(let drawing) = path {
                let builder = DrawingBuilder()
                builder.uuid = drawing?.uuid
                builder.timestamp = drawing?.timestamp
                builder.emotion = drawing?.emotion
                builder.strokes = drawing?.strokes ?? []
                return builder
            }
        }
        return nil
    }
    
}
