import Foundation

/// A type that represents a card element.
public protocol CardElementProtocol {
    /// A unique identifier associated with the item.
    var id: String { get }

    /// If `false`, this item will be removed from the visual tree.
    var isVisible: Bool { get set }

    /// When `true`, draw a separating line at the top of the element.
    var separator: Bool { get }

    /// Controls the amount of spacing between this element and the preceding element.
    var spacing: Spacing { get }

    /// Describes what to do when an unknown element is encountered or the requires of this or any children can’t be met.
    var fallback: Fallback<CardElement> { get }

    /// A series of key/value pairs indicating features that the item requires with corresponding minimum version.
    /// When a feature is missing or of insufficient version, fallback is triggered.
    var requires: [String: SemanticVersion] { get }
}
