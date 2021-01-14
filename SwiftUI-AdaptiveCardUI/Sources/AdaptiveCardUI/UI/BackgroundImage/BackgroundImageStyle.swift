#if canImport(SwiftUI)

    import NetworkImage
    import SwiftUI

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    struct BackgroundImageStyle: NetworkImageStyle {
        private let fillMode: ImageFillMode
        private let horizontalAlignment: HAlignment
        private let verticalAlignment: VAlignment

        init(
            fillMode: ImageFillMode,
            horizontalAlignment: HAlignment,
            verticalAlignment: VAlignment
        ) {
            self.fillMode = fillMode
            self.horizontalAlignment = horizontalAlignment
            self.verticalAlignment = verticalAlignment
        }

        func makeBody(state: NetworkImageState) -> some View {
            switch state {
            case .loading, .failed:
                EmptyView()
            case let .image(image, size):
                switch fillMode {
                case .repeat:
                    image.resizable(resizingMode: .tile)
                case .repeatHorizontally:
                    RepeatHorizontallyImageView(
                        image: image,
                        size: size,
                        verticalAlignment: verticalAlignment
                    )
                case .repeatVertically:
                    RepeatVerticallyImageView(
                        image: image,
                        size: size,
                        horizontalAlignment: horizontalAlignment
                    )
                default:
                    CoverImageView(
                        image: image,
                        aspectRatio: size.width / size.height,
                        horizontalAlignment: horizontalAlignment,
                        verticalAlignment: verticalAlignment
                    )
                }
            }
        }
    }

#endif
