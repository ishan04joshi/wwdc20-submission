import Foundation

final class Store: ObservableObject {
    
    private (set) var user: User = .mock
    private (set) var drawings = [UUID: Drawing]()
    
}

// MARK: - Saving
extension Store {
    
    func save(_ user: User) {
        self.user = user
    }
    func save(_ item: Drawing) {
        drawings[item.uuid] = item
    }

    
}

// MARK: - Mock
extension Store {
    static var mock: Store {
        let store = Store()
        store.save(.mock)
        store.save(Drawing(uuid: UUID(), timestamp: Date().addingTimeInterval(-360), emotion: .anger, strokes: []))
        return store
    }
}
