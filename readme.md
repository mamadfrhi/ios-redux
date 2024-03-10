# Trivago Challenge - BrandButton App

## Overview

The BrandButton app is a showcase project demonstrating a highly dynamic UI button component with an implementation of the Redux pattern for state management. This application is designed following SOLID principles, particularly focusing on the Open/Closed principle (O) and the Dependency Inversion Principle (D) to ensure extendability and maintainability.

## Architecture
![Architecture](uml.png)
The application utilizes a Redux-like state management system to handle the button state dynamically. It abstracts concrete implementations into protocols, allowing flexibility and making the codebase ready for future extensions with minimal changes.

## SOLID Foundations: Prioritizing Architecture for Adaptive UI"
I've prioritized developing an extendable architecture based on SOLID principles, focusing on system robustness and flexibility. This approach means the current UI doesn't exactly match the Figma design. However, because of the strong architecture, adjusting the design later is straightforward, involving minor code adjustments.

## Features

- Dynamic UI update for a custom `BrandButton` component.
- State managed by Redux-inspired `ButtonStore`.
- Actions dispatched based on user interaction, reflecting immediate UI changes.
- Extensible action enumeration `ButtonAction` facilitating new features addition.
- Decoupled View Controller logic via a `ButtonViewModel`.

## Usage

To see the BrandButton in action:

1. Touch and hold the button.
2. Drag outside the bounds of the button.
3. Observe the various states being showcased sequentially.

Each state change will occur with a 2-second interval, demonstrating the dynamic styling capabilities and state management of the button in real-time.

## Dependency Injection and Testability

The app's architecture incorporates Dependency Injection (DI), which abstracts renderers and state into protocols. This not only facilitates the change of button behavior but also enhances testability. The codebase is crafted to be unit-test friendly, allowing for efficient testing and QA processes.

```swift
class ButtonViewModel {
    
    init(initialState: ButtonStateable,
         primaryRenderer: BrandButtonRenderable,
         secondaryRenderer: BrandButtonRenderable) {
        // Implementation 
        }
}
```

## Snapshot Testing
The project includes snapshot tests to validate UI elements. These tests capture screenshots of UI states and compare them to reference images, helping to identify any visual changes. To execute the snapshot tests, use the keyboard shortcut `Command + U` in Xcode. This will run all unit and snapshot tests in the project.

## Extendability
Adding new functionalities can be done by appending new cases to the ButtonAction enum. The compiler's type safety will prompt the necessary implementations wherever the action is processed.

## Gestures and SwiftUI Compatibility
The BrandButton component is fully compatible with SwiftUI, enabling dynamic UI interactions through gestures. The integration with SwiftUI is facilitated through the `BrandButtonRepresentable` struct, which bridges the UIKit-based BrandButton with SwiftUI's declarative interface. This setup allows the button to react to state changes and user interactions in a SwiftUI environment.

To view the `BrandButton` component within a SwiftUI context, simply modify the `useSwiftUI` flag in the `SceneDelegate` to `true`. This flag controls whether the UIKit-based view controller or the SwiftUI view is presented as the root view controller.

```
let useSwiftUI = true
```


### Available Gestures in SwiftUI Implementation
Within the `BrandButtonView`, several gestures are configured to demonstrate the interactive and dynamic capabilities of the BrandButton:

**Tap Gesture:** A simple tap on the button toggles the highlight state, showcasing the button's response to basic user interaction.

**Drag Gesture (Minimum Distance: 0):** Initiates the button's highlight state to indicate a press-and-hold action.

**Drag Gesture (Minimum Distance: 5):** Changes the button's type (actionButton or successButton) based on the drag action's completion. This demonstrates the dynamic update of the button's appearance based on user interaction.

**Drag Gesture (Minimum Distance: 400):** Toggles the button's icon position between leading and trailing, or introduces an icon if none is set. This gesture showcases the ability to dynamically modify the button's icon configuration based on user actions.