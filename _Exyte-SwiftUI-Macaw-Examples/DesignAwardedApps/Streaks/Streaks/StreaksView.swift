import Foundation
import Macaw

class StreaksView: MacawView {

    var viewSize: Size!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: Group(contents: []), coder: aDecoder)
        self.viewSize = Size(
            w: Double(UIScreen.main.bounds.width),
            h: Double(UIScreen.main.bounds.height)
        )
        self.backgroundColor = UIColor(cgColor: Color(val: 0xFD704D).toCG())
        self.node = streaks()        
    }
    
    func streaks() -> Node {
        return [
            ("Medium post", "streaks-M"),
            ("Take a photo", "streaks-camera"),
            ("Cycle 5 km", "streaks-bike"),
            ("Brush your teeth", "streaks-tooth"),
            ("Practice guitar", "streaks-guitar"),
            ("Add a task", "streaks-plus")
        ].enumerated().map { (index, element) in
            let streak = Streak(
                text: element.0,
                imageName: element.1,
                viewSize: viewSize,
                addTask: index == 5
            )
            streak.place = Transform.move(
                dx: viewSize.w / 2 * Double(index % 2),
                dy: 30 + Double(Int(index / 2) * Int(viewSize.w / 2))
            )
            return streak
        }.group()
    }
}
