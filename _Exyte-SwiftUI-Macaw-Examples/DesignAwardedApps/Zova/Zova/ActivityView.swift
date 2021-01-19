import Foundation
import Macaw

class ActivityView: MacawView {
    var viewSize: Size!
    
    var texts: Group!
    var circle: ActivityCircle!
    var bar: ActivityBar!
    
    required init?(coder aDecoder: NSCoder) {

        let screenWidth = UIScreen.main.bounds.width
        var screenHeight = UIScreen.main.bounds.height

        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows.first
            let topPadding = window?.safeAreaInsets.top ?? 0
            let bottomPadding = window?.safeAreaInsets.bottom ?? 0

            screenHeight -= topPadding + bottomPadding
        }

        viewSize = Size(
            w: Double(screenWidth),
            h: Double(screenHeight)
        )
        
        texts = [
            Text(
                text: "Current Score",
                font: Font(name: boldFont, size: 24),
                fill: Color.white,
                align: .min,
                place: Transform.move(dx: 20.0, dy: 105.0)
            ),
            Text(
                text: "Your activity is up since last week",
                font: Font(name: regularFont, size: 16),
                fill: Color.white,
                align: .min,
                place: Transform.move(dx: 20.0, dy: 145.0)
            )
            ].group()
        
        circle = ActivityCircle()
        circle.place = Transform.move(dx: viewSize.w / 2, dy: viewSize.h / 2)
        
        bar = ActivityBar()
        bar.place = Transform.move(dx: 20.0, dy: viewSize.h - 160.0)

        super.init(node: Group(contents: [texts, circle, bar]), coder: aDecoder)
        backgroundColor = UIColor(cgColor: Color(val: 0x269CFE).toCG())
    }
    
    var customizeAnimation: Animation?
    
    func customize() {
        bar.stopJumping()
        
        let during = 0.5
        
        let hideNodes = [
            bar.opacityVar.animation(to: 0.0, during: during),
            texts.opacityVar.animation(to: 0.0, during: during)
        ].combine()
        
        let circleAnimation = circle.customize(during: during)
        
        customizeAnimation = [
            hideNodes,
            circleAnimation
        ].combine()
        
        customizeAnimation?.play()
    }
    
    func done() {
        customizeAnimation?.reverse().play()
        bar.jump()
    }
}
