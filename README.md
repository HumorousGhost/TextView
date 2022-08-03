# TextView

This project is only for SwiftUI

Due to the incomplete functions of `TextEditor` in `SwiftUI`, such as keyboardType setting, etc.,

`UITextView` is encapsulated for developers to use

Features will continue to be updated

## Preview

![image](https://github.com/HumorousGhost/RepositoryPerview/blob/main/InputViewPreview.gif)

## Supported Platforms

* iOS 13.0
* macOS 10.15
* tvOS 13.0
* watchOS 6.0

## Usage
    
```swift
import SwiftUI
import TextView

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        Text("Hello, world!")
            .padding()
        TextView($text, isSend: .constant(false), isTextCenter: true)
            .font(UIFont.systemFont(ofSize: 12))
            .foregroundColor(UIColor.yellow)
            .returnKeyType(.done)
            .returnKeyAutomatically(true)
            .keyboardType(.asciiCapable)
            .isFirstResponder(true)
            .onDidBegin({
                print("did begin editing")
            })
            .onDidEnd({
                print("did end editing")
            })
            .onShouldBegin({ in
                print("shouldBeginEditing")
                return true
            })
            .onShouldEnd({ _ in
                print("shouldEndEditing")
                return true
            })
            .onSubmit({ returnKeyType in
                print("click keyboard input button")
                return true
            })
            .background(Color.blue)
            .frame(width: 200, height: 100, alignment: .center)
    }
}
```

## Installation

You can add TextView to an Xcode project by adding it as a package dependency.

* From the **File** menu, select **Swift Packages** › **Add Package Dependency…**
* Enter https://github.com/HumorousGhost/TextView into the package repository URL text field
* Link **TextView** to your application target
