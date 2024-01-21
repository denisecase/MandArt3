import SwiftUI

@available(macOS 12.0, *)
extension MandArt3App {
  func appMenuCommands() -> some Commands {
    Group {
      // Disable "New Window" option
      // CommandGroup(replacing: .newItem) {}

      CommandMenu("Welcome") {
        Button("Show Welcome Screen") {
          let controller = WelcomeWindowController(appState: self.appState)
          controller.showWindow(self)
          controller.window?.makeKeyAndOrderFront(nil)
        }
      }

      // we don't need the Edit/pasteboard menu item (cut/copy/paste/delete)
      // so we'll replace it with nothing
      CommandGroup(replacing: CommandGroupPlacement.pasteboard) {}

      // Help has "Search" & "MandArt3 Help" by default
      // let's replace the MandArt help option with a Link
      // to our hosted documentation on GitHub Pages
      let displayText: String = "MandArt3 Help"
      let url: URL = .init(string: "https://denisecase.github.io/MandArt-Docs/documentation/mandart/")!
      CommandGroup(replacing: CommandGroupPlacement.help) {
        Link(displayText, destination: url)
      }
    }
  }
}
