import AppKit
import SwiftUI

/// View for the welcome screen informational content and show toggle.
@available(macOS 11.0, *)
struct WelcomeMainInformationView: View {
  @EnvironmentObject var appState: AppState
  let showWelcomeScreen: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("MandArt3 is the ultimate app for creating MandArt with exponent of 3 instead of 2.")
        .font(.title3)
        .fixedSize(horizontal: false, vertical: false) // wrap

      Text(
        "Find an interesting location (for example, near where two black areas meet), zoom in and out, and customize the coloring. Nearby colors flow into one another, so check their gradients to see how the intermediate colors appear. If you'll print your art, choose from colors more likely to print true."
      )
      .fixedSize(horizontal: false, vertical: true) // wrap

      Button(action: {
        NSApp.sendAction(#selector(NSWindow.performClose(_:)), to: nil, from: nil)
        NSDocumentController.shared.newDocument("new.mandart3")
      }) {
        Text("Click here to open default MandArt3 document and get started")
          .fontWeight(.semibold)
      }
      .buttonStyle(.bordered)
      .controlSize(.large)

      Toggle(isOn: $appState.shouldShowWelcomeWhenStartingUp) {
        Text("Show welcome screen when starting")
      }
      .onTapGesture {
        // do nothing else
      }
      .onChange(of: appState.shouldShowWelcomeWhenStartingUp) { newValue in
        UserDefaults.standard.setValue(newValue, forKey: "shouldShowWelcomeWhenStartingUp")
      }
    }
    .padding()
  }
}
