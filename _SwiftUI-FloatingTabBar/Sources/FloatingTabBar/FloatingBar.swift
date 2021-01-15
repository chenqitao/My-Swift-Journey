import SwiftUI

@available(iOS 13.0, *)
@available(OSX 10.15, *)
public struct BottomBar : View {
    @Binding public var selectedIndex: Int
    
    public let items: [BottomBarItem]
    
    public init(selectedIndex: Binding<Int>, items: [BottomBarItem]) {
        self._selectedIndex = selectedIndex
        self.items = items
    }
    
    func itemView(at index: Int) -> some View {
        Button(action: {
            withAnimation { self.selectedIndex = index }
        }) {
            BottomBarItemView(isSelected: index == selectedIndex, item: items[index])
        }
    }
    
    public var body: some View {
        
        ZStack {
            BlurView(style: .light).frame(height: 60)
            
            HStack(alignment: .center) {
                self.itemView(at: 0)
                Spacer()
                self.itemView(at: 1)
                Spacer()
                self.itemView(at: 2)
                Spacer()
                self.itemView(at: 3)
                Spacer()
                self.itemView(at: 4)
            }.padding([.horizontal]).animation(.default).padding(.bottom,0).padding(.top,0)
        }
    }
}

#if DEBUG
@available(iOS 13.0.0, *)
@available(OSX 10.15.0, *)
struct BottomBar_Previews : PreviewProvider {
    static var previews: some View {
        BottomBar(selectedIndex: .constant(0), items: [
            BottomBarItem(icon: "house.fill", color: .purple),
            BottomBarItem(icon: "heart", color: .pink),
            BottomBarItem(icon: "magnifyingglass", color: .orange),
            BottomBarItem(icon: "magnifyingglass", color: .orange),
            BottomBarItem(icon: "person.fill", color: .blue)
        ])
    }
}
#endif

