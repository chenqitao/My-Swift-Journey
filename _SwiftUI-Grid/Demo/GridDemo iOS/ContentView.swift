import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: ModularGridView()) {
                        HStack {
                            Image(systemName: "square.grid.3x2.fill")
                            Text("Modular Grid")
                        }
                    }
                    
                    NavigationLink(destination: StaggeredGridView()) {
                        HStack {
                            Image(systemName: "rectangle.3.offgrid.fill")
                            Text("Staggered Grid")
                        }
                    }
                    
                    NavigationLink(destination: SectionedGridView()) {
                        HStack {
                            Image(systemName: "rectangle.grid.1x2.fill")
                            Text("Sectioned Grid")
                        }
                    }
                    
                    NavigationLink(destination: StaticGridView()) {
                        HStack {
                            Image(systemName: "circle.grid.2x2.fill")
                            Text("Static Grid")
                        }
                    }
                }
            }
            .listStyle(
                GroupedListStyle()
            )
            .navigationBarTitle(Text("Grid"))
        }
        .navigationViewStyle(
            StackNavigationViewStyle()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
