import SwiftUI

extension View {
    // MARK: - Frame
    func frame(size: CGSize? = nil, alignment: Alignment = .center) -> some View {
        frame(width: size?.width, height: size?.height, alignment: alignment)
    }
    
    // MARK: - Fill
    func fillVertically() -> some View {
        frame(minHeight: 0, maxHeight: .infinity)
    }
    func fillHorizontally() -> some View {
        frame(minWidth: 0, maxWidth: .infinity)
    }
    func fill() -> some View {
        frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
    
}
