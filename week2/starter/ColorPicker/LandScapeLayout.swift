
import SwiftUI

struct LandScapeLayout: View {

  @State private var redValue: Double = 250
  @State private var greenValue: Double = 100
  @State private var blueValue: Double = 50

  @State private var committedRed: Double = 250
  @State private var committedGreen: Double = 100
  @State private var committedBlue: Double = 50

  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass


    var body: some View {
      ZStack {
        HStack() {
                   VStack {
                       Text("Color Picker")
                           .font(.largeTitle)
                           .bold()
                           .padding(.top, 10)
                       RoundedRectangle(cornerRadius: 0)
                           .fill(Color(red: committedRed/255, green: committedGreen/255, blue: committedBlue/255))
                           .background(
                               RoundedRectangle(cornerRadius: 0)
                                   .strokeBorder(LinearGradient(gradient: Gradient(colors: [Color(red: committedRed/255, green: committedGreen/255, blue: committedBlue/255)]), startPoint: .leading, endPoint: .trailing),
                                                 lineWidth: 10)
                                   .blur(radius: 5)
                           )
                           .frame(minWidth: 250, idealWidth: 300, maxWidth: .infinity, minHeight: 200, idealHeight: 250, maxHeight: .infinity)
                   }
          VStack(spacing: 35) {
                       colorSlider(title: "Red", value: $redValue, color: .red)
                       colorSlider(title: "Green", value: $greenValue, color: .green)
                       colorSlider(title: "Blue", value: $blueValue, color: .blue)
            Button {
                commitColors()
            } label: {
                Text("Set Color")
                    .padding()
                    .background(.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.white, lineWidth: 3)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
                   }
          .frame(minWidth: 150, idealWidth: 200, maxWidth: .infinity)
               }
        .padding(.horizontal)
      }
  }

  func colorSlider(title: String, value: Binding<Double>, color: Color) -> some View {
      VStack {
          Text(title)
        HStack {
          Slider(value: value, in: 0...255, step: 1)
                .accentColor(color)
              .frame(maxWidth: horizontalSizeClass == .compact && verticalSizeClass == .regular ? .infinity : 200)
          Text("\(Int(value.wrappedValue))")
        }

      }
  }

  func commitColors() {
        committedRed = redValue
        committedGreen = greenValue
        committedBlue = blueValue
    }
}

struct LandScapeLayout_Previews: PreviewProvider {
    static var previews: some View {
        LandScapeLayout()
    }
}
