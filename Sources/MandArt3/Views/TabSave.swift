import SwiftUI
import UniformTypeIdentifiers

@available(macOS 12.0, *)
struct TabSave: View {
  @ObservedObject var doc: MandArt3Document
  @ObservedObject var popupManager = PopupManager()
  @Binding var requiresFullCalc: Bool
  @Binding var showGradient: Bool

  var body: some View {
    ScrollView {
      VStack {
        Section(
          header:
          Text("Save Your Art")
            .font(.headline)
            .fontWeight(.medium)
            .padding(.bottom)
        ) {
          
          Button("Save Picture Inputs (as data file)") {
            doc.saveMandArtImageInputs()
          }
          .help("Save MandArt picture inputs as .mandart3.")

          Button("Save Picture (as .png)") {
            doc.saveMandArtImage()
          }
          .help("Save MandArt3 picture as .png.")
          
        } // end section
      } //  vstack
    } // scroll
    .onAppear {
      requiresFullCalc = false
      showGradient = false
    }
    .onDisappear {
      if requiresFullCalc {
        requiresFullCalc = false
      }
    }
  }
}