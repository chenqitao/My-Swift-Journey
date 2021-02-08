# :confetti_ball: ConfettiSwiftUI :confetti_ball:

Swift package for displaying configurable confetti animation.

Find the [demo project here](https://github.com/simibac/ConfettiSwiftUIDemo).

<p float="center">
  <img src="./Gifs/default.gif" width="400" />
</p>

### Installation:

It requires iOS 14 and Xcode 12!

In Xcode go to `File -> Swift Packages -> Add Package Dependency` and paste in the repo's url: `https://github.com/simibac/ConfettiSwiftUI` and select master branch.

### Usage:

Import the package in the file you would like to use it: `import ConfettiSwiftUI`

```swift
struct ContentView: View {
    @State var counter:Int = 0

    var body: some View {
        ZStack{
            Text("🎉").font(.system(size: 50)).onTapGesture(){counter += 1}
            ConfettiCannon(counter: $counter)
        }
    }
}
```

### Demo

Added an example project, with **iOS** target: https://github.com/simibac/ConfettiSwiftUIDemo

## Configurations

You can use the configurator app in [demo project here](https://github.com/simibac/ConfettiSwiftUIDemo) to make your desired animation or get inspired by one of the many examples.

<p float="center">
  <img src="./Gifs/configurator.png" width="300" />
  <img src="./Gifs/examples.png" width="300" />

</p>

#### Default Configuration

<p float="center">
  <img src="./Gifs/default.gif" width="300" />
</p>

Code:

```swift
ConfettiCannon(counter: $counter1)
```

#### Color and Size Configuration

<p float="center">
  <img src="./Gifs/color.gif" width="300" />
</p>

Code:

```swift
ConfettiCannon(counter: $counter2, colors: [.red, .black], confettiSize: 20)
```

#### Repeat Configuration

<p float="center">
  <img src="./Gifs/repeat.gif" width="300" />
</p>

Code:

```swift
ConfettiCannon(counter: $counter3, repetitions: 3, repetitionInterval: 0.7)
```

#### Firework Configuration

<p float="center">
  <img src="./Gifs/explosion.gif" width="300" />
</p>

Code:

```swift
ConfettiCannon(counter: $counter4, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
```

#### Emoji Configuration

<p float="center">
  <img src="./Gifs/heart.gif" width="300" />
</p>

Code:

```swift
ConfettiCannon(counter: $counter5, confettis: [.text("❤️"), .text("💙"), .text("💚"), .text("🧡")])
```

#### Endless Configuration

<p float="center">
  <img src="./Gifs/constant.gif" width="300" />
</p>

Code:

```swift
ConfettiCannon(counter: $counter6, num:1, confettis: [.text("💩")], confettiSize: 20, repetitions: 100, repetitionInterval: 0.1)
```

#### Make-it-Rain Configuration

<p float="center">
  <img src="./Gifs/make-it-rain.gif" width="300" />
</p>

Code:

```swift
ConfettiCannon(counter: $counter7, num:1, confettis: [.text("💵"), .text("💶"), .text("💷"), .text("💴")], confettiSize: 30, repetitions: 50, repetitionInterval: 0.1)
```

### Parameters

| parameter            | type         | description                                           | default                                                 |
| -------------------- | ------------ | ----------------------------------------------------- | ------------------------------------------------------- |
| counter              | Binding<Int> | on any change of this variable triggers the animation | 0                                                       |
| num                  | Int          | amount of confettis                                   | 20                                                      |
| confettis               | [ConfettiType]     | list of shapes and text                             | [.shape(.circle), .shape(.triangle), .shape(.square), .shape(.slimRectangle), .shape(.roundedCross)]                                             |
| colors               | [Color]      | list of colors applied to the default shapes          | [.blue, .red, .green, .yellow, .pink, .purple, .orange] |
| confettiSize         | CGFloat      | size that confettis and emojis are scaled to          | 10.0                                                    |
| rainHeight           | CGFloat      | vertical distance that confettis pass                 | 600.0                                                   |
| fadesOut             | Bool         | size that confettis and emojis are scaled to          | true                                                    |
| opacity              | Double       | maximum opacity during the animation                  | 1.0                                                     |
| openingAngle         | Angle        | boundary that defines the opening angle in degrees    | Angle.degrees(60)                                       |
| closingAngle         | Angle        | boundary that defines the closing angle in degrees    | Angle.degrees(120)                                      |
| radius               | CGFloag      | explosion radius                                      | 300.0                                                   |
| repetitions          | Int          | number of repetitions fo the explosion                | 0                                                       |
| repetitionInterval   | Double       | duration between the repetitions                      | 1.0                                                     |
