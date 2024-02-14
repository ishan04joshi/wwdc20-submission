import PlaygroundSupport
import SwiftUI

let user = User(name: "ISHAN JOSHI", avatar: "👨🏻‍💻")

let app = BigLittleFeelings(user: user)
let window = UIWindow(
    frame: CGRect(x: 0, y: 0, width: 500, height: 750)
)
window.rootViewController = app
window.makeKeyAndVisible()


PlaygroundPage.current.setLiveView(app.view)
