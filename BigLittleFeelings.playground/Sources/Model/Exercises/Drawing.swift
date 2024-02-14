import SwiftUI

struct Drawing {
    let uuid: UUID
    let timestamp: Date
    let emotion: Emotion
    let strokes: [Stroke]
}

struct Stroke {
    var color: Color
    var points = [CGPoint]()
}

final class DrawingBuilder {
    var uuid: UUID?
    var timestamp: Date?
    var emotion: Emotion?
    var strokes = [Stroke]()
    
    func build() -> Drawing? {
        guard let timestamp = timestamp, let emotion = emotion else { return nil }
        return Drawing(
            uuid: uuid ?? UUID(),
            timestamp: timestamp,
            emotion: emotion,
            strokes: strokes
        )
    }
}

extension Drawing: Equatable {}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

extension Stroke: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(color)
        hasher.combine(points)
    }
}
