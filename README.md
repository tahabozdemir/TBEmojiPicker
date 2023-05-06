![Banner](Readme/banner.png)

<p align="center">
  <img width="320" alt="Emoji Picker Preview" src="https://user-images.githubusercontent.com/91073428/236648841-ae01670d-d7f4-4335-bc1e-e8fecf7a2714.jpg">
</p>

# TBEmojiPicker
This library to show a view to pick emojis for iOS.

## Requirements
- iOS 14.0 or later

## Installation
### Swift Package Manager

The [Swift Package Manager](https://www.swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

In Xcode navigate to File → Swift Packages → Add Package Dependency. Use this URL to add the dependency:

```
‌https://github.com/tahabozdemir/TBEmojiPicker
```

Once you have your Swift package set up, adding as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/tahabozdemir/TBEmojiPicker", .upToNextMajor(from: "1.0.0"))
]
```
### Quick Start

```swift
import SwiftUI
import TBEmojiPicker

struct ContentView: View {
    @State var selected: String = ""
    @State var isSheet: Bool = false
    var body: some View {
        VStack {
            Text("Selected Emoji is : \(selected)")
            Button("Select an Emoji") {
                isSheet.toggle()
            }
            .sheet(isPresented: $isSheet) {
                TBEmojiPicker(selectedEmoji: $selected)
            }
        }
    }
}
```

## Usage
### Selected Emoji
A binding to the selected emoji variable
```swift
 TBEmojiPicker(selectedEmoji: $selected)
```
### Selected Color
Color of the border of the selected emoji. The default value of this property is `Color.blue`.
```swift
 TBEmojiPicker(selectedEmoji: $selected, selectedColor: Color.orange)
```

### Grid Column Count
Count of grid column. The default value of this property is `5`
```swift
 TBEmojiPicker(selectedEmoji: $selected, selectedColor: Color.orange)
```

### Bottom Navigation Bar
Color of the border of the selected emoji The default value of this property is `BottomNavBar(backgroundColor: .black, foregroundColor: .white)`.
```swift
TBEmojiPicker(selectedEmoji: $selected, bottomNavBar: BottomNavBar(backgroundColor: Color.orange, foregroundColor: .white))
```

## Authors

- [@tahabozdemir](https://www.github.com/tahabozdemir)
