import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    class Coordinator: NSObject, MKMapViewDelegate {
        @Binding var mapType: MKMapType

        init(mapType: Binding<MKMapType>) {
            _mapType = mapType
        }
    }

    @Binding var mapType: MKMapType

    func makeCoordinator() -> Coordinator {
        Coordinator(mapType: $mapType)
    }

    func makeUIView(context: Context) -> MKMapView {
        let view = MKMapView(frame: .zero)
        view.delegate = context.coordinator
        return view
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = mapType

    }
}
