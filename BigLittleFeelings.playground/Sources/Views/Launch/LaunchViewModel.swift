import Foundation

final class LaunchViewModel: ObservableObject {
    
    private let builder: UserBuilder
    private let store: Store
    
    private(set) lazy var photo: PhotoViewModel = {
        let viewModel = PhotoViewModel(builder: builder)
        viewModel.delegate = hello
        return viewModel
    }()
    private(set) lazy var hello: HelloViewModel = {
        HelloViewModel(builder: builder)
    }()
    
    init(builder: UserBuilder = UserBuilder(), store: Store) {
        self.builder = builder
        self.store = store
        builder.name = store.user.name
        builder.avatar = store.user.avatar
    }
    
    func save() {
        builder.build().map(store.save)
    }
    
}
