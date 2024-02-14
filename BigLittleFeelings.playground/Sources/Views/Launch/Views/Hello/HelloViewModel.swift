import Foundation

final class HelloViewModel: ObservableObject {
    
    private let builder: UserBuilder
    
    var title: String { "hello" }
    var subtitle: String { "MY NAME IS" }
    var placeholder: String { "type your name :)" }
    var footer: String { Strings.footer }
    
    @Published var name: String { didSet { builder.name = name } }
    
    init(builder: UserBuilder = UserBuilder()) {
        self.builder = builder
        self.name = builder.name ?? ""
    }
    
}

extension HelloViewModel: PhotoViewModelDelegate {
    func didSet(new user: User) {
        name = builder.name ?? ""
    }
}
