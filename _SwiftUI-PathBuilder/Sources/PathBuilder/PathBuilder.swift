import SwiftUI

/// A custom parameter attribute that constructs paths from closures.
@_functionBuilder
public struct PathBuilder {

    public static func buildBlock(_ components: PathComponent...) -> PathComponent {
        return Subpath(path: Path { path in
            for component in components {
                component.add(to: &path)
            }
        })
    }

    /// Provides support for “if” statements in multi-statement closures, producing an optional path component that is added only when the condition evaluates to true.
    public static func buildIf(_ component: PathComponent?) -> PathComponent {
        return component.flatMap { component in
            Subpath { component }
        } ?? Subpath()
    }

    public static func buildEither(first: PathComponent) -> PathComponent {
        return first
    }

    public static func buildEither(second: PathComponent) -> PathComponent {
        return second
    }
}
