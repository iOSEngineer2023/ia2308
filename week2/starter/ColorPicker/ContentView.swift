import SwiftUI

struct ContentView: View {


    @State private var redValue: Double = 250
    @State private var greenValue: Double = 100
    @State private var blueValue: Double = 50

    @State private var committedRed: Double = 250
    @State private var committedGreen: Double = 100
    @State private var committedBlue: Double = 50

  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass

    var body: some View {
      Group {
          if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            PortraitLayout()
          } else {
              LandScapeLayout()
          }
      }
  }
    }





struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
      ContentView()
        .preferredColorScheme(.dark)

    }
  }
}
