import SwiftUI

enum Style {
    enum Color {
        static let background = SwiftUI.Color(white: 0.98)
        
        static let black = SwiftUI.Color(white: 0.4)
        static let lightGray = SwiftUI.Color(white: 0.75)
        static let lighterGray = SwiftUI.Color(white: 0.85)
        static let gray = SwiftUI.Color(white: 0.6)
        
        static let purple = SwiftUI.Color(red: 230/255, green: 207/255, blue: 230/255)
        static let green = SwiftUI.Color(red: 190/255, green: 175/255, blue: 169/255)
        static let red = SwiftUI.Color(red: 239/255, green: 185/255, blue: 164/255)
        static let blue = SwiftUI.Color(red: 105/255, green: 106/255, blue: 194/255)
        
        static func accentColor(for exercise: Exercise) -> SwiftUI.Color {
            switch exercise {
            case .emotions:
                return purple
            case .drawing:
                return green
            case .affirmations:
                return red
            case .gratitude:
                return blue
            }
        }
    }
    enum Font {
        static func font(size: CGFloat) -> SwiftUI.Font {
            SwiftUI.Font.system(size: size, design: .rounded)
        }
        static func font(style: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
            SwiftUI.Font.system(style, design: .rounded)
        }
        static func chalk(size: CGFloat) -> SwiftUI.Font {
            SwiftUI.Font.custom("Silkscreen-Regular", size: size)
        }
        static func chalk(style: UIFont.TextStyle) -> SwiftUI.Font {
            SwiftUI.Font.custom(
                "Silkscreen-Regular",
                size: UIFont.preferredFont(forTextStyle: style).pointSize
            )
        }
    }
    enum Insets {
        static var base: EdgeInsets {
            EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        }
    }
}
